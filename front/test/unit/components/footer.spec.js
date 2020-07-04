import { render } from '@vue/server-test-utils'
import footer from '@/src/components/footer'

describe('footer.vue', () => {
    it('renders a div', async () => {
		const wrapper = await render(footer)
		expect(wrapper.text()).toContain('<div></div>')
	  })
})