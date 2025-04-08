;; Property Registration Contract
;; Records details of commercial structures

(define-data-var contract-owner principal tx-sender)

;; Data structure for property details
(define-map properties
  { property-id: uint }
  {
    owner: principal,
    location: (string-utf8 100),
    size-sqm: uint,
    building-type: (string-utf8 50),
    construction-year: uint,
    registration-date: uint
  }
)

;; Property ID counter
(define-data-var next-property-id uint u1)

;; Register a new property
(define-public (register-property
                (location (string-utf8 100))
                (size-sqm uint)
                (building-type (string-utf8 50))
                (construction-year uint))
  (let ((property-id (var-get next-property-id)))
    (begin
      (asserts! (> size-sqm u0) (err u1))
      (asserts! (> construction-year u1900) (err u2))
      (map-set properties
        { property-id: property-id }
        {
          owner: tx-sender,
          location: location,
          size-sqm: size-sqm,
          building-type: building-type,
          construction-year: construction-year,
          registration-date: block-height
        }
      )
      (var-set next-property-id (+ property-id u1))
      (ok property-id)
    )
  )
)

;; Update property details (only owner can update)
(define-public (update-property
                (property-id uint)
                (location (string-utf8 100))
                (size-sqm uint)
                (building-type (string-utf8 50))
                (construction-year uint))
  (let ((property (unwrap! (map-get? properties { property-id: property-id }) (err u404))))
    (begin
      (asserts! (is-eq (get owner property) tx-sender) (err u403))
      (asserts! (> size-sqm u0) (err u1))
      (asserts! (> construction-year u1900) (err u2))
      (map-set properties
        { property-id: property-id }
        {
          owner: tx-sender,
          location: location,
          size-sqm: size-sqm,
          building-type: building-type,
          construction-year: construction-year,
          registration-date: (get registration-date property)
        }
      )
      (ok true)
    )
  )
)

;; Read-only function to get property details
(define-read-only (get-property (property-id uint))
  (map-get? properties { property-id: property-id })
)

;; Check if caller is the owner of a property
(define-read-only (is-property-owner (property-id uint) (owner principal))
  (match (map-get? properties { property-id: property-id })
    property (is-eq (get owner property) owner)
    false
  )
)
