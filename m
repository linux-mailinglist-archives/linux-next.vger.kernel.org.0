Return-Path: <linux-next+bounces-4501-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 068A89B3ACD
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 20:52:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28F421C20B30
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 19:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8167E18EFEC;
	Mon, 28 Oct 2024 19:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hy7mVKkO"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFAF524C;
	Mon, 28 Oct 2024 19:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730145145; cv=none; b=puwNduhMEn7vxKhWHMa5JE1Z+GMdPn3lW/2fQK4puzzOewxtKBkMZIBTFYW7IZvbF6vNUVsN03FTbdZFSf+4E5Njf2QFsSz8g/pecpDe4t1lwxBAAdrH/aESOZTus+zsjPrc1GkDmpeBgm1jpznxT/TJs7bCdinf8HC7QzHGQvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730145145; c=relaxed/simple;
	bh=Ul+QBVc+YnNy2tXI88GGtUMlSaX13YfqOBf387SSnCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=McwsezeSQynOGaVNsQkL2DFIjHKLghYJll83rDHauvYC9bzWGbMFDrQlumK4VvE31dong1UKh2Zvc2sr/68F2tI/6Osh7iQuXLBcShtThstTl+LfhJOPxMmTR81vtibvFIixpyq1if+XCNNKnaNC7KKfZIgsz4u1u3ZnziMtOUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hy7mVKkO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 230D7C4AF0B;
	Mon, 28 Oct 2024 19:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730145145;
	bh=Ul+QBVc+YnNy2tXI88GGtUMlSaX13YfqOBf387SSnCA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Hy7mVKkO3XRYO8YWVrUTgHYinB3RiMlhYWP11k1m52FZ+ii3U61nFlGXTdSJQjOJs
	 slNtI7p1h8mB/ZzCQsZo4AFl+/9NWGv7zBc7OOybScNasnNc4ZmgX3B4vauP0vfHE+
	 6TzsmkQAhm+SVulymqgjaKwf2Q3K4SmddGQF/TYxL/yvK+LgwlHLgpen18QFw5y0cU
	 UPBupjnkFBG8/AJq9OAkn+O//L3/nWZNwZ+967EW8yx6eBeDz8qD4TcMyZu7TY9JLJ
	 h7Nb3uhYaEu6BE0rw1ByScNbrHN15rzP1FjYlUoBNf5heDwtKxMaCWICzPiapPsKrh
	 9pPiJaxhBcjlQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so5787892e87.1;
        Mon, 28 Oct 2024 12:52:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVKgtVq7oAu4oWVIYjJYsh575ox2v+zkCqcbGUuemFZxUSpimL7LvdB4VGT65pG/eoxEL1qLzDTWOLXUQ==@vger.kernel.org, AJvYcCVXjV1Fu3iTcmtTicNB7Bhu6/2ZIPG5uUXoIdZ4dUzigax1YsqXwfNA/OTlVHsbZrcNq/kZKEQaQH/9Bcs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy69gab0qbVIf6LR4DJkOdhlE01eEtIpVKluF6SO5XchyzgNMrd
	cvYkIckXWz9t9EZlt6A8NRDvxeBbeTzpN+PZo6ARS2WIK8FF7PipG6WMaQ9x5Yjwq2sTDl90q6A
	WnsPApT+ak4ZxG2w/4GKMTswATQ==
X-Google-Smtp-Source: AGHT+IHZQIXoMf901p3J/xgrany/8b01LghURtWvew8IISJPoYjj2YNAA8I9ZSkMEW+VoWXGPDwYES18VSeZo2tXQbU=
X-Received: by 2002:a05:6512:230a:b0:53b:1f7a:9bf8 with SMTP id
 2adb3069b0e04-53b34a34190mr3665907e87.55.1730145143491; Mon, 28 Oct 2024
 12:52:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028122405.27090-1-herve.codina@bootlin.com>
 <20241028122405.27090-2-herve.codina@bootlin.com> <CAL_JsqK7SjfJ7Re4k-A8fQB+tNHyM3r2Rcpct_zUfR2yhEj+iQ@mail.gmail.com>
 <20241028184343.74ad5a26@bootlin.com>
In-Reply-To: <20241028184343.74ad5a26@bootlin.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 28 Oct 2024 14:52:09 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+_VHsMKufVwUj3Q0pv1X6d8Xe0FN6A9svCmWJ3cuuUqQ@mail.gmail.com>
Message-ID: <CAL_Jsq+_VHsMKufVwUj3Q0pv1X6d8Xe0FN6A9svCmWJ3cuuUqQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] misc: lan966x_pci: Fix dtc warns 'missing or empty
 reg/ranges property'
To: Herve Codina <herve.codina@bootlin.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Allan Nielsen <allan.nielsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 12:43=E2=80=AFPM Herve Codina <herve.codina@bootlin=
.com> wrote:
>
> Hi Rob,
>
> On Mon, 28 Oct 2024 08:55:24 -0500
> Rob Herring <robh@kernel.org> wrote:
>
> > On Mon, Oct 28, 2024 at 7:24=E2=80=AFAM Herve Codina <herve.codina@boot=
lin.com> wrote:
> > >
> > > dtc generates the following warnings when building the LAN966x device
> > > tree overlay (lan966x_pci.dtso):
> > >   Warning (simple_bus_reg): /fragment@0/__overlay__/pci-ep-bus@0/cpu_=
clk: missing or empty reg/ranges property
> > >   Warning (simple_bus_reg): /fragment@0/__overlay__/pci-ep-bus@0/ddr_=
clk: missing or empty reg/ranges property
> > >   Warning (simple_bus_reg): /fragment@0/__overlay__/pci-ep-bus@0/sys_=
clk: missing or empty reg/ranges property
> > >
> > > Indeed, related nodes are under the pci-ep-bus (simple-bus) which is =
not
> > > correct.
> > >
> > > Put them outside this node.
> > >
> > > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Closes: https://lore.kernel.org/all/20241025110919.64b1cffb@canb.auug=
.org.au/
> > > Fixes: 185686beb464 ("misc: Add support for LAN966x PCI device")
> > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > ---
> > > The referenced commit is in the reset tree
> > > ---
> > >  drivers/misc/lan966x_pci.dtso | 36 +++++++++++++++++----------------=
--
> > >  1 file changed, 18 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci=
.dtso
> > > index 7282687df25f..5466d013da7d 100644
> > > --- a/drivers/misc/lan966x_pci.dtso
> > > +++ b/drivers/misc/lan966x_pci.dtso
> > > @@ -19,6 +19,24 @@ __overlay__ {
> > >                         #address-cells =3D <3>;
> > >                         #size-cells =3D <2>;
> > >
> > > +                       cpu_clk: cpu_clk {
> >
> > Preferred node name is "clock-<freq-in-hz>"
>
> I based the name on the lan966x.dtsi
> https://elixir.bootlin.com/linux/v6.12-rc1/source/arch/arm/boot/dts/micro=
chip/lan966x.dtsi#L38

That should be fixed too.

> Of course, I can rename the cpu_clk, ddr_clk and sys_clk nodes but this w=
ill create
> a difference against lan966x.dtsi on some points that should be identical=
.

Then maybe they should be sharing a .dtsi?

> Let me know with that in mind if I need to rename those nodes in this ser=
ies.

Yes, easier now than later.

> > Also, as a general rule, don't use "_" in node names (and properties).
> >
> > Isn't there a schema for the device which needs these nodes added to
> > it? If not, there should be.
> >
>
> No, there is no schema yet for this device.
>
> How can we describe schema for this kind of devices that are using
> device-tree overlays?

Describing is not the issue. Running the checks is. Though you can run
the checks at runtime.

> I mean, this overlay is applied on a PCI device DT node. This DT node is
> computed at runtime. It is, in the end, available in the base DT before
> applying the overlay.
> The compatible string that could be used to check the dtso against schema
> cannot be set in the overlay (at least not at the correct place in the
> hierarchy) without causing a property memory leak at runtime. An overlay
> cannot add a property in a base DT node without generating a memory leak
> and so, we avoid adding such properties in the base DT from the overlay.

That's a problem with overlays in general which we need to solve at some po=
int.

> Is this missing schema blocking for this series ?

No.

Rob

