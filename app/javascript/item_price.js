window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const fee = document.getElementById("add-tax-price");
    const percentage = 0.1;
    fee.innerHTML = Math.floor(inputValue * percentage);

    const profit = document.getElementById("profit");
    const profit_ratio = 0.9;
    profit.innerHTML = Math.floor(inputValue * profit_ratio);
  })
})