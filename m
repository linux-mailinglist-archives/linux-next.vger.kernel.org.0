Return-Path: <linux-next+bounces-9301-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3A0C9B057
	for <lists+linux-next@lfdr.de>; Tue, 02 Dec 2025 11:03:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9342F3414A4
	for <lists+linux-next@lfdr.de>; Tue,  2 Dec 2025 10:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A9530CD9E;
	Tue,  2 Dec 2025 10:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T7MXT2Ni"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F4027702E
	for <linux-next@vger.kernel.org>; Tue,  2 Dec 2025 10:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764669802; cv=none; b=EzLUf4tJ2+2UnsCombp+ezuS6SywOJyhdxOnQ0tWI7EqVWvq2Leinb42CVSZCQn1UP3GjDeqH5RjeCs/8JX7tyhl/SsIiuSzDnfz9flU/9xxJm+38lpnQh5ywzIm00Us3rCmrEtMKtHDE0OKodz92i4Xwt7jvB+RuQsv+wr5y7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764669802; c=relaxed/simple;
	bh=slDn459xGIAqDEFTR+AjwfkF1R8D3PspK/nTzIs6OrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gFLitZi4IUpJjtjsKHrCMzXqGCWBkeswpjnzL/z5m9EOPhmYaW2AVhGgQBg9261ghYObRwf+Y37Wjrz8ZVLTM3wUNA+pnqLiX0H9Tb3hOINuWz3v0l1AMpzDVRpcRetenwHk0wOnPPnt0E3K0FPBxXf3w7fSn/RvXn79z6TpL7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T7MXT2Ni; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-640a503fbe8so2478134a12.1
        for <linux-next@vger.kernel.org>; Tue, 02 Dec 2025 02:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764669798; x=1765274598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slDn459xGIAqDEFTR+AjwfkF1R8D3PspK/nTzIs6OrY=;
        b=T7MXT2Ni0zgMmXGrbRZs6omdOidelpLdYINjL8dWka5xCXF60zUcygqEImUueSi4NE
         r0zImGEMLG5dE/s4n11AR8CD0FEWPe7ArzZIXU5kHjq7Eucoqej8XYevY92lBHcKy5xe
         UykBrFuAD8mXQbaBPJkoi7vE6QiVo3DMuY1ZZE2+oWuR+jbXSQ58N+K9U5tOzQxUQyZA
         YVuFDm3jTnl70eGPXGSKt55ICPSGeYCvB/mH1R0QrBQafCMGT4Jd7lYQUuJOewu7aiyJ
         6FdmA889LnoS5HGNyrY0rXhvxJ9jUG0yLwHfazvSfr2aqN61d2pw3XR3WYPTMTIVQA+F
         v3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764669798; x=1765274598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=slDn459xGIAqDEFTR+AjwfkF1R8D3PspK/nTzIs6OrY=;
        b=pyaJUuM/EKTdPW7phA7sQD6qsX8HBNoC5/kghY6bOn3lDxHwLJj5/TeBwHPbJ0jxb4
         6Y8G+OPoCehwNc5I9GZRLznV09u9nR1m4KFhra67BUWDCJjiuylqIt93//VcXdyfunWN
         HTRkvlysmdDF5Z+cK7SglKrviKABCnNv4c2xOnkBKSP2zCTMnqeFPqiv4jGnMKm+UYvI
         hhM2SqAbV9y6qp7W6VO34IUQ7ooVCL8lQl1CzGm/nPlAf+ICfU/wywkkZrBjEQOrkSlS
         aKNadwNtaWI3N8SQIz8ZP4nbRdOaGEgY+vtB++DNhdBOGtWGjEaKJ1CuqB6rsfpoJqlS
         4nxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTz21oESAzjiDJj5xiiyKrxDd0WJAzpZTkXKT+TkaynXq5hSOrYwHQvmvZPDDxGQ7gDzvDNBdpYVOQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwmZTas5AdH/Ca0Iyzb5QKAPt7s21kV20xGTVrpqOWMwkgvdcGg
	mAQ9jR5sy7QltxECgFT7+UxwEfKjcFGqJVYbFb9+zjOg6PlT4H6HHrm/l4senujavqbfKh08F0Q
	MUJCHTRlmA8pJwVdeaqEGy6PqubFWXmCF8net6Ry0tg==
X-Gm-Gg: ASbGncufdH+0rrkDKWjjrfi5c+F5ZlClvYiGX2FdoXUpu7xkASpaOnJNh5/zGha0rHA
	V9CbKMNR/4iTYOxDXViU0rRqaR1wTDJGXGF/utnqWXxakx23Fl3ClCPdgjgEazvZkHNtitPZRYK
	PLF7QCABHYV69gaGvSBj0gcj+JRsdbjYBQMvenNU43UZB7T2c/WFtmzVw/UvCyNYy69owLVvtJ6
	Er50PzSVTb8SmTr3NznbiTpAempQ/TZ4aRrH95VMrBNauMKX8TmfIAriDakaPzC2ZBXEcVVvPF8
	6a+oMZfjt4UuEnQt5jx4Tf4=
X-Google-Smtp-Source: AGHT+IEzBZUvVe8v+NU3LgQcNDFZ1ywLGlvr4nq6P74LNME9ZQgiTo5FgVQnVsGl1RzS2H+nuAAtY4Diulatz7/9lxo=
X-Received: by 2002:a05:6402:1ed5:b0:641:3651:7107 with SMTP id
 4fb4d7f45d1cf-645eb23bc16mr27607615a12.12.1764669798505; Tue, 02 Dec 2025
 02:03:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251128162928.36eec2d6@canb.auug.org.au> <63e1daf7-f9a3-463e-8a1b-e9b72581c7af@infradead.org>
 <ykmo5qv46mo7f3srblxoi2fvghz722fj7kpm77ozpflaqup6rk@ttvhbw445pgu>
 <CAKfTPtA-wir5GzU7aTywe7SZG18Aj8Z9g1wjV-Y8vKoyKF1Mkg@mail.gmail.com> <vb6pcyaue6pqpx626ytfr2aif4luypopywqoazjsvy4crh6zic@gfv75ar7musy>
In-Reply-To: <vb6pcyaue6pqpx626ytfr2aif4luypopywqoazjsvy4crh6zic@gfv75ar7musy>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 2 Dec 2025 11:03:07 +0100
X-Gm-Features: AWmQ_bnvt_8myvimspzAlsv7ON2LSirITDuqDAMojw-oVlxKenWaOKPgLgNEaRI
Message-ID: <CAKfTPtCKmj_dHGU-2WPsEevf7CR-isRiyM0+oftCrMy5MswE4A@mail.gmail.com>
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

On Tue, 2 Dec 2025 at 10:53, Manivannan Sadhasivam <mani@kernel.org> wrote:
>
> On Tue, Dec 02, 2025 at 09:54:24AM +0100, Vincent Guittot wrote:
> > On Tue, 2 Dec 2025 at 05:24, Manivannan Sadhasivam <mani@kernel.org> wr=
ote:
> > >
> > > + Vincent
> >
> > Thanks for looping me in.
> > >
> > > On Sat, Nov 29, 2025 at 07:00:04PM -0800, Randy Dunlap wrote:
> > > >
> > > >
> > > > On 11/27/25 9:29 PM, Stephen Rothwell wrote:
> > > > > Hi all,
> > > > >
> > > > > Changes since 20251127:
> > > > >
> > > >
> > > > on i386 (allmodconfig):
> > > >
> > > > WARNING: modpost: vmlinux: section mismatch in reference: s32g_init=
_pcie_controller+0x2b (section: .text) -> memblock_start_of_DRAM (section: =
.init.text)
> >
> > Are there details to reproduce the warning ? I don't have such warning
> > when compiling allmodconfig locally
> >
> > s32 pcie can only be built in but I may have to use
> > builtin_platform_driver_probe() instead of builtin_platform_driver()
> >
>
> The is due to calling a function belonging to the __init section from non=
-init
> function. Ideally, functions prefixed with __init like memblock_start_of_=
DRAM()
> should be called from the module init functions.
>
> One way to fix would be to call memblock_start_of_DRAM() in probe(), and
> annotate probe() with __init. Since there is no remove, you could use
> builtin_platform_driver_probe().
>
> This also makes me wonder if we really should be using memblock_start_of_=
DRAM()
> in the driver. I know that this was suggested to you during reviews, but =
I would
> prefer to avoid it, especially due to this being the __init function.

yeah, I suppose I can directly define the value in the driver has
there is only one memory config for now anyway

/* Boundary between peripheral space and physical memory space */
#define S32G_MEMORY_BOUNDARY_ADDR 0x80000000

>
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

