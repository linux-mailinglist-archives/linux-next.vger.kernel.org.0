Return-Path: <linux-next+bounces-9303-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EEAC9B203
	for <lists+linux-next@lfdr.de>; Tue, 02 Dec 2025 11:25:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6332D3410D6
	for <lists+linux-next@lfdr.de>; Tue,  2 Dec 2025 10:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9EF30F93B;
	Tue,  2 Dec 2025 10:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qGtwm/Og"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BF630F924
	for <linux-next@vger.kernel.org>; Tue,  2 Dec 2025 10:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764671109; cv=none; b=cEMntcEm1gV7Y1mad2y7nuIFewr/H+1WqPZrFyWn/QKh6E9jYy1n9/Zrp2AVkDUlylWsXA4/0CwuhyiMClbDB8egDT5Xfq+V5W3Y4/qr7ZbyCBOCyXCOuacUx+Ku/uZPH3NfM+WSmthjpwHsD0gCjsyk2D3VJmI11ylr5xnLNEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764671109; c=relaxed/simple;
	bh=pSvE4AT6OXFfClpNe9rSToN+KDDOheGQkgrzpcEFf7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lx0kWW4FzLJ4zw2x5KVytgFTdMcqNpDFUPEtXj1mJcITLbF7z2B8SBFQeuf5XE1omJT9JYUOE2Z95g6FSBifQNNela12aimZRp3HkA0Sju3ABuDNO3kTLxByYhgFM5o3tAA0pVPhpNzq8kH0aAgZifR2KL6DWE6gE9Pmmq3bA/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qGtwm/Og; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b77030ffad9so635247966b.0
        for <linux-next@vger.kernel.org>; Tue, 02 Dec 2025 02:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764671105; x=1765275905; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9F+kG2WqkAYgELZzGbRFHTmjlUcifa4ki8f7o3ssRY8=;
        b=qGtwm/OgrkdvcIQOmHBHVt4VySZSJ5+sedIqP5+DUw/70d8Y2TY9/GEW9o1VRKJ3At
         pI0oOlMlYdDt4m52Zo1sUCSHPoBihyamvNzYNGTckQn2Z23m48mdnYe2izFZE1NJh9AX
         tMsJouGXKvckqu1w5byw+I8AJBnRGDL7M1Hn0wkQs+ZiECvDe+AZKXeiYPSKivAcLLRx
         7/3oJLmYjpNJLFskFxRWYuXSwO4NsZB0D3OhxjacioZGhnXTQKAJdlolg+ye6D1yLt47
         LQDiWkekeZtuEk0tJ4253Gb7PtvePYOIkmvOiaXtriWSqXT7faTdqnRIXfJh1FS5kQdv
         mEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764671105; x=1765275905;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9F+kG2WqkAYgELZzGbRFHTmjlUcifa4ki8f7o3ssRY8=;
        b=Cf8SdnL3VZPiVxxKUmYfY0+xmx2cXOahX+QEFqP8Bh1kxO0wuQBH41HNxxKoJzTAuu
         Gi0yCltBxTCfW/WAlxEXGlWCWh3bMkdy1FB1PEJ80POVVO1RloQhYPx6rBglInYYlPQW
         6xFHBPdi+9hWlkISKclFqeT8gmYKG3lfI1hetVmie6DXxFqIHrS+NuaOzKuHKGMdOgMD
         VlC6eRV0TzbRiRCMOaduJEOnxjXx7th/7CILIt5sCq1W7V0xSe0Z40mNhNQq/w/wAeLP
         mBXFDwhcNFZclmkrzE9UUs4bzU+7bj3Oir0IyOsYPnrsgrKn0UbA3luj3KbC/rWIfI6q
         ilsg==
X-Forwarded-Encrypted: i=1; AJvYcCWVFpf73mCuMJomeMNuqiB/LGDDEH8qTwT25XRam9rPDXvoGJ2Bxe/O8H0i4cBcckC/DGdnB1R3YxYG@vger.kernel.org
X-Gm-Message-State: AOJu0YykUoGtC+aaQZQz7WPWK4j82seTFv+g4G2h3qLLW9UWFs+dUjBu
	oPYvEbe7gwAL3ohbaJ3XrgOUAmuxX32oLwxyxFIHXBIDjwG9ykY7gNiC20GHbLj7hVcrIIOZlVp
	zhzEjmvYOxK7dbFTfFEpkhcwspXxCjSzQIbG3GuqMU0u/DueyEWBr
X-Gm-Gg: ASbGncuvUoWSY0QJB12XNxl23vTEnCP2oUr5pa9q1exonmtqgMn8SoT/cNPjSd6YByH
	XIbiIpc+30jO8C/zBRsvWt1LxobnUCRmwJxE2x4wajRboMRR/U0I55eKS2d1erokAI0ijbIAEuB
	L9XQX7xVE/RYV4VouWTUn6EepILUtMQcqrI9xXhzw5wGUxOtUByp0K1JQhbtHTWjhPybEqegSns
	RyQGFc9YlTBBOe8Kx3EwTBYYc1zBDsK5m882I6kaV8CCOPgxGyGywrZ9AHqXRhZ/LyxbE9YU2D9
	WekP/tqJ6EajzWlh+ohhiC4BFIiGD6TXqQ==
X-Google-Smtp-Source: AGHT+IFeIg09WwzL5CLtleL+CNmHwhQV6vEuLIx5Fl2LU6DZGnHpNrCnyZsUrJae/DQnhwmUFLH/yStogQ2YhR3HkVY=
X-Received: by 2002:a17:906:b208:b0:b76:bb0e:5ac9 with SMTP id
 a640c23a62f3a-b76bb0e5b20mr2495117366b.40.1764671105183; Tue, 02 Dec 2025
 02:25:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251128162928.36eec2d6@canb.auug.org.au> <63e1daf7-f9a3-463e-8a1b-e9b72581c7af@infradead.org>
 <ykmo5qv46mo7f3srblxoi2fvghz722fj7kpm77ozpflaqup6rk@ttvhbw445pgu>
 <CAKfTPtA-wir5GzU7aTywe7SZG18Aj8Z9g1wjV-Y8vKoyKF1Mkg@mail.gmail.com>
 <vb6pcyaue6pqpx626ytfr2aif4luypopywqoazjsvy4crh6zic@gfv75ar7musy>
 <CAKfTPtCKmj_dHGU-2WPsEevf7CR-isRiyM0+oftCrMy5MswE4A@mail.gmail.com> <6ulzkdgd6j35ptu5mesgtgh2xa6fwalcmkgcxr2fdjwwfvzhrf@4dtcadsl2mvm>
In-Reply-To: <6ulzkdgd6j35ptu5mesgtgh2xa6fwalcmkgcxr2fdjwwfvzhrf@4dtcadsl2mvm>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 2 Dec 2025 11:24:53 +0100
X-Gm-Features: AWmQ_blE1MXJMGsP4HVSDepyDYEV9gPAzgGeXgYsjEilqSbt5qtjWWttwjyQjSI
Message-ID: <CAKfTPtABGj6Nys8J8x8Y-PvybORQUoVN0mGLS=qZ__zXqvCWPQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Nov 28 (drivers/pci/controller/dwc/pcie-nxp-s32g.o)
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, linux-pci@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, NXP S32 Linux Team <s32@nxp.com>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, linux-arm-kernel@lists.infradead.org, 
	Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2 Dec 2025 at 11:12, Manivannan Sadhasivam <mani@kernel.org> wrote:
>
> On Tue, Dec 02, 2025 at 11:03:07AM +0100, Vincent Guittot wrote:
> > On Tue, 2 Dec 2025 at 10:53, Manivannan Sadhasivam <mani@kernel.org> wr=
ote:
> > >
> > > On Tue, Dec 02, 2025 at 09:54:24AM +0100, Vincent Guittot wrote:
> > > > On Tue, 2 Dec 2025 at 05:24, Manivannan Sadhasivam <mani@kernel.org=
> wrote:
> > > > >
> > > > > + Vincent
> > > >
> > > > Thanks for looping me in.
> > > > >
> > > > > On Sat, Nov 29, 2025 at 07:00:04PM -0800, Randy Dunlap wrote:
> > > > > >
> > > > > >
> > > > > > On 11/27/25 9:29 PM, Stephen Rothwell wrote:
> > > > > > > Hi all,
> > > > > > >
> > > > > > > Changes since 20251127:
> > > > > > >
> > > > > >
> > > > > > on i386 (allmodconfig):
> > > > > >
> > > > > > WARNING: modpost: vmlinux: section mismatch in reference: s32g_=
init_pcie_controller+0x2b (section: .text) -> memblock_start_of_DRAM (secti=
on: .init.text)
> > > >
> > > > Are there details to reproduce the warning ? I don't have such warn=
ing
> > > > when compiling allmodconfig locally
> > > >
> > > > s32 pcie can only be built in but I may have to use
> > > > builtin_platform_driver_probe() instead of builtin_platform_driver(=
)
> > > >
> > >
> > > The is due to calling a function belonging to the __init section from=
 non-init
> > > function. Ideally, functions prefixed with __init like memblock_start=
_of_DRAM()
> > > should be called from the module init functions.
> > >
> > > One way to fix would be to call memblock_start_of_DRAM() in probe(), =
and
> > > annotate probe() with __init. Since there is no remove, you could use
> > > builtin_platform_driver_probe().
> > >
> > > This also makes me wonder if we really should be using memblock_start=
_of_DRAM()
> > > in the driver. I know that this was suggested to you during reviews, =
but I would
> > > prefer to avoid it, especially due to this being the __init function.
> >
> > yeah, I suppose I can directly define the value in the driver has
> > there is only one memory config for now anyway
> >
> > /* Boundary between peripheral space and physical memory space */
> > #define S32G_MEMORY_BOUNDARY_ADDR 0x80000000
> >
>
> Ok. I fixed it up myself with below diff:

Thanks !

The change looks good to me

>
> diff --git a/drivers/pci/controller/dwc/pcie-nxp-s32g.c b/drivers/pci/con=
troller/dwc/pcie-nxp-s32g.c
> index eacf0229762c..70b1dc404bbe 100644
> --- a/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> +++ b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> @@ -7,7 +7,6 @@
>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> -#include <linux/memblock.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/of_address.h>
> @@ -35,6 +34,9 @@
>  #define PCIE_S32G_PE0_INT_STS                  0xE8
>  #define HP_INT_STS                             BIT(6)
>
> +/* Boundary between peripheral space and physical memory space */
> +#define S32G_MEMORY_BOUNDARY_ADDR              0x80000000
> +
>  struct s32g_pcie_port {
>         struct list_head list;
>         struct phy *phy;
> @@ -99,10 +101,10 @@ static struct dw_pcie_ops s32g_pcie_ops =3D {
>  };
>
>  /* Configure the AMBA AXI Coherency Extensions (ACE) interface */
> -static void s32g_pcie_reset_mstr_ace(struct dw_pcie *pci, u64 ddr_base_a=
ddr)
> +static void s32g_pcie_reset_mstr_ace(struct dw_pcie *pci)
>  {
> -       u32 ddr_base_low =3D lower_32_bits(ddr_base_addr);
> -       u32 ddr_base_high =3D upper_32_bits(ddr_base_addr);
> +       u32 ddr_base_low =3D lower_32_bits(S32G_MEMORY_BOUNDARY_ADDR);
> +       u32 ddr_base_high =3D upper_32_bits(S32G_MEMORY_BOUNDARY_ADDR);
>
>         dw_pcie_dbi_ro_wr_en(pci);
>         dw_pcie_writel_dbi(pci, COHERENCY_CONTROL_3_OFF, 0x0);
> @@ -149,7 +151,7 @@ static int s32g_init_pcie_controller(struct dw_pcie_r=
p *pp)
>          * Make sure we use the coherency defaults (just in case the sett=
ings
>          * have been changed from their reset values)
>          */
> -       s32g_pcie_reset_mstr_ace(pci, memblock_start_of_DRAM());
> +       s32g_pcie_reset_mstr_ace(pci);
>
>         dw_pcie_dbi_ro_wr_en(pci);
>
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

