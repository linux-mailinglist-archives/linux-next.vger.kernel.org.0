Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EFED36B525
	for <lists+linux-next@lfdr.de>; Mon, 26 Apr 2021 16:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233573AbhDZOmd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Apr 2021 10:42:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:50414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233752AbhDZOmc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Apr 2021 10:42:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9694061006;
        Mon, 26 Apr 2021 14:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619448111;
        bh=6g07FO2VO963B4HNfzm2aScjBVrvPljEOFOxdK7FBQc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J+7klCgshTWUdrDUD9XompiNo1FL5QInI9sVNcfw2MphQJPszTr9eGi0vQ6LqpKaG
         sAJF+X7WaSkukY936AS9f44nSJBHFVO3MmQ0JMo8f5XcC4UtfRMmlkRcvbADpl/6lf
         9tthHsL+jWvR+7A49enLYoslYPhn6sJOTFeknkZ17F2jN6OyDt5b636LtxUWKvz8Xz
         nndBMDIiKsy6bsJCJzY7aChukcdTID1S8/YqIIvrCN14t0MFO9p2sUDPSVYt6KGAuc
         5Evkgodqy1z7KWlHK7YOMDAv/BB8hj21VvrNgnw+cTLu+u4a+F05r32ms75yxfem+y
         aakopFzMDdA3w==
Date:   Mon, 26 Apr 2021 15:41:21 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Greg KH <greg@kroah.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexandru Ardelean <aardelean@deviqon.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Tomislav Denis <tomislav.denis@avl.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the staging tree
Message-ID: <20210426144121.GE4590@sirena.org.uk>
References: <20210329165525.32d51a3a@canb.auug.org.au>
 <YGFwWq//sh6onrUH@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Uwl7UQhJk99r8jnw"
Content-Disposition: inline
In-Reply-To: <YGFwWq//sh6onrUH@kroah.com>
X-Cookie: Zeus gave Leda the bird.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--Uwl7UQhJk99r8jnw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 29, 2021 at 08:14:50AM +0200, Greg KH wrote:

> Thanks for the fix, looks correct to me.

Here's the SPI pull request if you want to pull it in:

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git tags/spi-=
v5.13

for you to fetch changes up to 86527bcbc88922ea40df05d28189ee15489d2cf1:

  spi: Rename enable1 to activate in spi_set_cs() (2021-04-23 15:36:18 +010=
0)

----------------------------------------------------------------
spi: Updates for v5.13

The only core work for SPI this time around is the completion of the
conversion to the new style method for specifying transfer delays,
meaning we can cope with what most controllers support more directly
using conversions in the core rather than open coding in drivers.
Otherwise it's a good stack of cleanups and fixes plus a few new
drivers.

The conversion to new style transfer delay will cause an issue with a
newly added staging driver which has a straightforward resolution in
-next.

 - Completion of the conversion to new style transfer delay
   configuration.
 - Introduction and use of module_parport_driver() helper, merged here
   as there's no parport tree.
 - Support for Altera SoCs on DFL buses, NXP i.MX8DL, HiSilicon Kunpeng,
   MediaTek MT8195,

----------------------------------------------------------------
Alain Volmat (2):
      spi: stm32: avoid ifdef CONFIG_PM for pm callbacks
      spi: stm32: Fix use-after-free on unbind

Alexander Sverdlin (1):
      spi: omap2-mcspi: Activate pinctrl idle state during runtime suspend

Alexandru Ardelean (10):
      spi: spi-axi-spi-engine: remove usage of delay_usecs
      spi: bcm63xx-spi: don't check 'delay_usecs' field
      spi: spi-bcm-qspi: replace 'delay_usecs' with 'delay.value' check
      spi: spi-sh: replace 'delay_usecs' with 'delay.value' in pr_debug
      spi: spi-tegra20-flash: don't check 'delay_usecs' field for spi trans=
fer
      staging: greybus: spilib: use 'spi_delay_to_ns' for getting xfer delay
      spi: spi-falcon: remove check for 'delay_usecs'
      spi: fsl-espi: remove usage of 'delay_usecs' field
      spi: core: remove 'delay_usecs' field from spi_transfer
      spi: docs: update info about 'delay_usecs'

Amit Kumar Mahapatra (1):
      spi: spi-zynqmp-gqspi: Resolved slab-out-of-bounds bug

Andy Shevchenko (5):
      parport: Introduce module_parport_driver() helper macro
      spi: butterfly: Switch to use module_parport_driver()
      spi: lm70llp: Switch to use module_parport_driver()
      spi: Make error handling of gpiod_count() call cleaner
      spi: Rename enable1 to activate in spi_set_cs()

Antonio Borneo (1):
      spi: stm32: drop devres version of spi_register_master

Arnd Bergmann (2):
      spi: rockchip: avoid objtool warning
      spi: stm32-qspi: fix debug format string

Christophe JAILLET (1):
      spi: fsi: add a missing of_node_put

Christophe Kerello (1):
      spi: stm32-qspi: fix pm_runtime usage_count counter

Clark Wang (1):
      spi: imx: add a check for speed_hz before calculating the clock

Colin Ian King (1):
      spi: Fix spelling mistake "softwade" -> "software"

David Bauer (3):
      spi: ath79: always call chipselect function
      spi: ath79: remove spi-master setup and cleanup assignment
      spi: sync up initial chipselect state

Dinghao Liu (2):
      spi: spi-zynqmp-gqspi: Fix runtime PM imbalance in zynqmp_qspi_probe
      spi: spi-zynqmp-gqspi: Fix runtime PM imbalance in zynqmp_qspi_probe

Eddie James (1):
      spi: fsi: Remove multiple sequenced ops for restricted chips

Fabio Estevam (1):
      spi: imx: Improve driver description

Han Xu (1):
      spi: spi-nxp-fspi: Add imx8dxl driver support

Heikki Krogerus (4):
      spi: Add support for software nodes
      ARM: pxa: icontrol: Constify the software node
      ARM: pxa: zeus: Constify the software node
      spi: Remove support for dangling device properties

Heiko Schocher (2):
      spi: fspi: enable fspi driver for on imx8mp
      dt-bindings: spi: add compatible entry for imx8mp in FlexSPI controll=
er

Jarkko Nikula (1):
      spi: pxa2xx: Add support for Intel Alder Lake PCH-M

Jay Fang (14):
      spi: cadence-quadspi: Silence shiftTooManyBitsSigned warning
      spi: spi-topcliff-pch: Fix checkpatch spacing error
      spi: sprd: Fix checkpatch spacing error
      spi: pxa2xx: Fix checkpatch spacing errors
      spi: omap-100k: Fix checkpatch spacing errors
      spi: spi-mtk-nor: Fix checkpatch spacing error
      spi: dln2: Fix open brace following function definitions go on the ne=
xt line
      spi: spi-bitbang: Fix open brace following function definitions go on=
 the next line
      spi: jcore: Fix trailing statements should be on next line
      spi: spi-mem: Fix code indent should use tabs where possible
      spi: rockchip: Fix code indent should use tabs where possible
      spi: pl022: Fix trailing whitespace
      spi: Add HiSilicon SPI Controller Driver for Kunpeng SoCs
      spi: hisi-kunpeng: Fix Woverflow warning on conversion

Joe Burmeister (1):
      spi: Handle SPI device setup callback failure.

Junlin Yang (1):
      spi: cadence-quadspi: add missing of_node_put

Krzysztof Kozlowski (3):
      spi: s3c64xx: simplify getting of_device_id match data
      spi: s3c64xx: correct kerneldoc of s3c64xx_spi_port_config
      spi: s3c64xx: constify driver/match data

Kuldeep Singh (4):
      spi: spi-nxp-fspi: Add support for IP read only
      spi: spi-nxp-fspi: Implement errata workaround for LS1028A
      spi: spi-nxp-fspi: Add imx8dxl support
      spi: Convert Freescale QSPI binding to json schema

Leilk Liu (4):
      spi: update spi master bindings for MT8195 SoC
      spi: update spi slave bindings for MT8195 SoC
      spi: mediatek: add mtk_spi_compatible support
      spi: mediatek: add mt8195 spi slave support

Linus Walleij (5):
      spi: pl022: User more sensible defaults
      spi: pl022: Drop custom per-chip cs_control
      spi: pl022: Use GPIOs looked up by the core
      spi: pl022: Convert to use GPIO descriptors
      ARM/spi: spear: Drop PL022 num_chipselect

Mark Brown (11):
      Merge existing fixes from spi/for-5.12
      Merge series "parport: Introduce module_parport_driver() and use it" =
=66rom Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
      Merge series "spi: finalize 'delay_usecs' removal/transition" from Al=
exandru Ardelean <aardelean@deviqon.com>:
      Merge series "spi: Adding support for software nodes" from Heikki Kro=
gerus <heikki.krogerus@linux.intel.com>:
      Merge series "enable flexspi support on imx8mp" from Heiko Schocher <=
hs@denx.de>:
      Merge series "Convert Cadence QSPI bindings to yaml" from Pratyush Ya=
dav <p.yadav@ti.com>:
      Merge series "spi: spi-zynqmp-gpspi: fix some issues" from quanyang.w=
ang@windriver.com Quanyang Wang <quanyang.wang@windriver.com>:
      Merge series "Minor updates for hisi-sfc-v3xx" from Yicong Yang <yang=
yicong@hisilicon.com>:
      Merge branch 'for-5.12' of https://git.kernel.org/pub/scm/linux/kerne=
l/git/broonie/spi into spi-5.13
      Merge series "spi: stm32-qspi: Fix and update" from <patrice.chotard@=
foss.st.com> Patrice Chotard <patrice.chotard@foss.st.com>:
      Merge series "spi: altera: Add DFL bus support for Altera SPI" from m=
atthew.gerlach@linux.intel.com Matthew Gerlach <matthew.gerlach@linux.intel=
=2Ecom>:

Mason Zhang (1):
      spi: mt6779: update spi document

Matthew Gerlach (2):
      spi: altera: separate core code from platform code
      spi: altera: Add DFL bus driver for Altera API Controller

Muhammad Usama Anjum (1):
      spi: orion: set devdata properly as it is being used later

Patrice Chotard (3):
      spi: stm32-qspi: Trigger DMA only if more than 4 bytes to transfer
      spi: stm32-qspi: Add dirmap support
      spi: stm32-qspi: Fix compilation warning in ARM64

Quanyang Wang (9):
      spi: spi-zynqmp-gqspi: use wait_for_completion_timeout to make zynqmp=
_qspi_exec_op not interruptible
      spi: spi-zynqmp-gqspi: add mutex locking for exec_op
      spi: spi-zynqmp-gqspi: transmit dummy circles by using the controller=
's internal functionality
      spi: spi-zynqmp-gqspi: fix incorrect operating mode in zynqmp_qspi_re=
ad_op
      spi: spi-zynqmp-gqspi: fix clk_enable/disable imbalance issue
      spi: spi-zynqmp-gqspi: fix hang issue when suspend/resume
      spi: spi-zynqmp-gqspi: fix use-after-free in zynqmp_qspi_exec_op
      spi: spi-zynqmp-gqspi: return -ENOMEM if dma_map_single fails
      spi: tools: make a symbolic link to the header file spi.h

Rafa=C5=82 Mi=C5=82ecki (1):
      spi: brcm,spi-bcm-qspi: convert to the json-schema

Ramuthevar Vadivel Murugan (1):
      spi: Convert cadence-quadspi.txt to cadence-quadspi.yaml

Seiya Wang (1):
      dt-bindings: spi: Add compatible for Mediatek MT8195

Shivamurthy Shastri (1):
      spidev: Add Micron SPI NOR Authenta device compatible

Tian Tao (3):
      spi: orion: Use device_get_match_data() helper
      spi: simplify devm_spi_register_controller
      spi: davinci: Use device_get_match_data() helper

Tudor Ambarus (3):
      spi: spi-ti-qspi: Free DMA resources
      spi: spi-ti-qspi: Free DMA resources
      spi: atmel: Drop unused variable

Wan Jiabing (1):
      spi: Remove repeated struct declaration

Wang Li (2):
      spi: fsl-lpspi: Fix PM reference leak in lpspi_prepare_xfer_hardware()
      spi: qup: fix PM reference leak in spi_qup_remove()

Wei Yongjun (3):
      spi: dln2: Fix reference leak to master
      spi: omap-100k: Fix reference leak to master
      spi: spi-zynqmp-gqspi: Fix missing unlock on error in zynqmp_qspi_exe=
c_op()

William A. Kennington III (1):
      spi: Fix use-after-free with devm_spi_alloc_*

Yang Yingliang (1):
      spi: fsl: add missing iounmap() on error in of_fsl_spi_probe()

Yicong Yang (2):
      spi: hisi-sfc-v3xx: fix potential irq race condition
      spi: hisi-sfc-v3xx: drop unnecessary ACPI_PTR and related ifendif pro=
tection

=C3=81lvaro Fern=C3=A1ndez Rojas (4):
      spi: bcm63xx-spi: fix pm_runtime
      spi: bcm63xx-hsspi: fix pm_runtime
      spi: bcm63xx-spi: fix pm_runtime
      spi: bcm63xx-hsspi: fix pm_runtime

 .../devicetree/bindings/spi/brcm,spi-bcm-qspi.txt  | 245 ----------
 .../devicetree/bindings/spi/brcm,spi-bcm-qspi.yaml | 198 ++++++++
 .../devicetree/bindings/spi/cadence-quadspi.txt    |  68 ---
 .../devicetree/bindings/spi/cdns,qspi-nor.yaml     | 143 ++++++
 .../devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml  |  96 ++++
 .../bindings/spi/mediatek,spi-mtk-nor.yaml         |   1 +
 .../devicetree/bindings/spi/spi-fsl-qspi.txt       |  66 ---
 .../devicetree/bindings/spi/spi-mt65xx.txt         |   2 +
 .../devicetree/bindings/spi/spi-nxp-fspi.txt       |   2 +
 .../devicetree/bindings/spi/spi-slave-mt27xx.txt   |   1 +
 Documentation/spi/spi-summary.rst                  |   7 +-
 MAINTAINERS                                        |  10 +-
 arch/arm/mach-pxa/icontrol.c                       |  12 +-
 arch/arm/mach-pxa/zeus.c                           |   6 +-
 arch/arm/mach-spear/spear320.c                     |   2 -
 arch/arm/mach-spear/spear3xx.c                     |  10 -
 drivers/spi/Kconfig                                |  28 +-
 drivers/spi/Makefile                               |   5 +-
 drivers/spi/{spi-altera.c =3D> spi-altera-core.c}    | 166 +------
 drivers/spi/spi-altera-dfl.c                       | 204 +++++++++
 drivers/spi/spi-altera-platform.c                  | 172 +++++++
 drivers/spi/spi-ath79.c                            |   3 +-
 drivers/spi/spi-atmel.c                            |   4 -
 drivers/spi/spi-axi-spi-engine.c                   |  12 +-
 drivers/spi/spi-bcm-qspi.c                         |   2 +-
 drivers/spi/spi-bcm63xx-hsspi.c                    |   7 +-
 drivers/spi/spi-bcm63xx.c                          |   8 +-
 drivers/spi/spi-bitbang.c                          |   9 +-
 drivers/spi/spi-butterfly.c                        |  13 +-
 drivers/spi/spi-cadence-quadspi.c                  |   8 +-
 drivers/spi/spi-davinci.c                          |   9 +-
 drivers/spi/spi-dln2.c                             |   5 +-
 drivers/spi/spi-falcon.c                           |   2 +-
 drivers/spi/spi-fsi.c                              |  31 +-
 drivers/spi/spi-fsl-espi.c                         |  17 +-
 drivers/spi/spi-fsl-lpspi.c                        |   2 +-
 drivers/spi/spi-fsl-spi.c                          |  23 +-
 drivers/spi/spi-hisi-kunpeng.c                     | 505 +++++++++++++++++=
++++
 drivers/spi/spi-hisi-sfc-v3xx.c                    |   7 +-
 drivers/spi/spi-imx.c                              |  39 +-
 drivers/spi/spi-jcore.c                            |   3 +-
 drivers/spi/spi-lm70llp.c                          |  13 +-
 drivers/spi/spi-mem.c                              |   6 +-
 drivers/spi/spi-mtk-nor.c                          |   2 +-
 drivers/spi/spi-nxp-fspi.c                         | 115 ++++-
 drivers/spi/spi-omap-100k.c                        |  14 +-
 drivers/spi/spi-omap2-mcspi.c                      |  24 +-
 drivers/spi/spi-orion.c                            |   5 +-
 drivers/spi/spi-pl022.c                            | 108 +----
 drivers/spi/spi-pxa2xx-pci.c                       |   2 +-
 drivers/spi/spi-pxa2xx.c                           |   6 +-
 drivers/spi/spi-qup.c                              |   2 +-
 drivers/spi/spi-rockchip.c                         |  19 +-
 drivers/spi/spi-s3c64xx.c                          |  31 +-
 drivers/spi/spi-sh.c                               |   4 +-
 drivers/spi/spi-slave-mt27xx.c                     |  36 +-
 drivers/spi/spi-sprd-adi.c                         |   2 +-
 drivers/spi/spi-stm32-qspi.c                       | 106 ++++-
 drivers/spi/spi-stm32.c                            |  39 +-
 drivers/spi/spi-tegra20-sflash.c                   |   3 +-
 drivers/spi/spi-ti-qspi.c                          |  20 +-
 drivers/spi/spi-topcliff-pch.c                     |   3 +-
 drivers/spi/spi-zynqmp-gqspi.c                     | 178 ++++----
 drivers/spi/spi.c                                  |  97 ++--
 drivers/spi/spidev.c                               |   1 +
 drivers/staging/greybus/spilib.c                   |   5 +-
 include/linux/amba/pl022.h                         |  10 -
 include/linux/parport.h                            |  12 +-
 include/linux/spi/altera.h                         |  21 +
 include/linux/spi/spi.h                            |  23 +-
 tools/spi/Makefile                                 |   5 +-
 71 files changed, 2003 insertions(+), 1062 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/spi/brcm,spi-bcm-qspi=
=2Etxt
 create mode 100644 Documentation/devicetree/bindings/spi/brcm,spi-bcm-qspi=
=2Eyaml
 delete mode 100644 Documentation/devicetree/bindings/spi/cadence-quadspi.t=
xt
 create mode 100644 Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
 create mode 100644 Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.=
yaml
 delete mode 100644 Documentation/devicetree/bindings/spi/spi-fsl-qspi.txt
 rename drivers/spi/{spi-altera.c =3D> spi-altera-core.c} (56%)
 create mode 100644 drivers/spi/spi-altera-dfl.c
 create mode 100644 drivers/spi/spi-altera-platform.c
 create mode 100644 drivers/spi/spi-hisi-kunpeng.c

--Uwl7UQhJk99r8jnw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCG0RAACgkQJNaLcl1U
h9Byogf/Z4LGnR0ib+Vq3SfiE6qT9TZ8iwmk+yS6VsR0zX9JzVzYLIvFhcbHKIm4
+cf6WJQyGRqBGK4WDHD9JlGjki6IGwSSuVQCTE2tCafXvEL7dI48cwuyV9m4yJbK
q+Gxn91MjT/GcH/b5OCkywEChF/XDWueoJeDiLR02P1RBr1q33H0d9KW8lLt5AID
1Td596DZN2NsahuCm4cP+/rAyRxZQM5en8maY8T+LAlEQU4y0lJ32PHOcHB17r3g
NFn5wLIDni3pN17QipcU9hO0bbi+AgZ1Pa9BxAs0Jaf2zzWHfkXHwcYYBuaVTZfV
V4iR7MtihemSveF0rJrNDfNIuo6VJA==
=Fd3S
-----END PGP SIGNATURE-----

--Uwl7UQhJk99r8jnw--
