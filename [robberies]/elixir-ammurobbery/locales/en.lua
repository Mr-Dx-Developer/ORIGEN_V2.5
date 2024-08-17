local Translations = {
  ammurobbery = {
    ["police_notification"] = "AMMUNATION ROBBERY IN PROGRESS",
    ["vitine_target_label"] = "Rob showcase",
    ["shelf_target_label"] = "Rob Shelf",
    ["animation_searching"] = "SEARCHING...",
    ["error_inventory"] = "you have to much in pockets.",
    ["error_empty_vitrine"] = "This is empty...",
    ["error_failed"] = "Failed...",
    ["error_cooldown"] = "The store was recently robbed and is empty...",
    ["error_no_police"] = "No police...",
  },
}
Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
