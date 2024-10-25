Return-Path: <linux-next+bounces-4437-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4ED9B0463
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 15:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60B481C20C4F
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 13:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243B418E76C;
	Fri, 25 Oct 2024 13:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LaLVjiRv"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED54870820;
	Fri, 25 Oct 2024 13:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729863881; cv=none; b=KzHqwA0Lg12neYXBl3PCSzS2dQZz4qG1O8fDGxTpyGNnTLL2FD97ap/2KSuTlCaj2e5aToWAvbP6Mmqz4dFg/pBStTGW6wIMkA11zXgL3q6EM61zeISQMN7WyJ+YIv2ZBLtY1+2DSZYvT7PxFZdRY2trpe/DVy8DlTb525DdPfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729863881; c=relaxed/simple;
	bh=OWi83xLvNyaJbHUqQahFchOvDl+zAl80qOKRfO+99+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z+gC6btdKnyJSFLcuk1OCHDpUifwzyNGjPqgeUV5kNpV0Bsxtfh3KZlnwHOEQPQ4ER9dZp2lw+/54dzZTVDFGzTR9z4qxhizLjKXGfQblPSQCy0hl/CTJFmwyTdCIaQwVEHK9WiQLGNMSzb3YfiLQcUCzDc/5zSlE23a90GAYe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LaLVjiRv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87BB2C4CEE8;
	Fri, 25 Oct 2024 13:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729863880;
	bh=OWi83xLvNyaJbHUqQahFchOvDl+zAl80qOKRfO+99+8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LaLVjiRvXp9wy8/9UJbN6gFLz/5ocXCDLCzkQ9dMCq4e87EIcIbaGjfay2ilBNycv
	 Z+9cCnJcDewPN1n4i3jMYs8G+QSLstoEIjgslI/v2k5/OJe8oXV8gyB3tn7f4+pXBr
	 s7xLR0inP+PUqCW8cnZLmPV5qhB41K5MpnqBcCIgSbcRnWzbhJdT2JwI8aMCa+UxJr
	 AtD1ne9TNEPqVJUmFIyI8ChEbmUjf4OnQr2wB94kgjyd8Yn3p+etMiwdHJbtBUnftV
	 O2aNBhSy9hnO0+q5JDJl1SncZnCXEHn8DN5k0f3u0ybZQPQVF03s60AXMLv4qdgYHf
	 tyRlpB15SZ3zw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso2165111e87.2;
        Fri, 25 Oct 2024 06:44:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVMnVS4dikNCDL1aGBi+ro4etpzHsAINZsx97tpTdtaz0s65a/dUdMFL3rPGg/7i43IUIrEcuSckd9h9A==@vger.kernel.org, AJvYcCXJFfRHr/Mla6b9VJQCymo7L4mD8/S99doVIVSZe888lOpYIIbvk5oOzhFT2nLB/DDsAEJOb4P4MsZ5R1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTawJCrM378OJozYESaYLaWcG+a007ud37Pa9GpmfrDvEdIH5c
	lgzYwfgpjYiWcNO2Uj+VCA4ZZwL/UKjukCKPX1blL7WQ/JqG8hmtYKdesmfYMe5uPzHijuWD6Zj
	dtmB4g52Zl5DIv9lQpmqL2jhuhg==
X-Google-Smtp-Source: AGHT+IENoy/jGQPne0Im/kWpBclZZWRMzgO73xKW6fsrv1bsZ8qxcRpWf+R9zsUf1+oltU6mbr6JAmk+SuM2Tp+tIh4=
X-Received: by 2002:a05:6512:3c95:b0:539:f10b:ffa2 with SMTP id
 2adb3069b0e04-53b1a34759cmr5071277e87.35.1729863878795; Fri, 25 Oct 2024
 06:44:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025110919.64b1cffb@canb.auug.org.au> <20241025082817.28056f52@bootlin.com>
In-Reply-To: <20241025082817.28056f52@bootlin.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 25 Oct 2024 08:44:26 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLvUygPQYhsaCuRjwPXJrKR9sASWWLvrSTsBdR44SBbuA@mail.gmail.com>
Message-ID: <CAL_JsqLvUygPQYhsaCuRjwPXJrKR9sASWWLvrSTsBdR44SBbuA@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the reset tree
To: Herve Codina <herve.codina@bootlin.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 1:28=E2=80=AFAM Herve Codina <herve.codina@bootlin.=
com> wrote:
>
> Hi all,
>
> On Fri, 25 Oct 2024 11:09:19 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> > Hi all,
> >
> > After merging the reset tree, today's linux-next build (x86_64
> > allmodconfig) produced this warning:
> >
> > drivers/misc/lan966x_pci.dtso:34.23-40.7: Warning (interrupts_property)=
: /fragment@0/__overlay__/pci-ep-bus@0/oic@e00c0120: Missing interrupt-pare=
nt
> >
> > Introduced by commit
> >
> >   185686beb464 ("misc: Add support for LAN966x PCI device")
> >
>
> This warning is normal.
> interrupt-parent is not present in the oic node. This was discussed in
> https://lore.kernel.org/all/CAL_Jsq+je7+9ATR=3DB6jXHjEJHjn24vQFs4Tvi9=3Dv=
hDeK9n42Aw@mail.gmail.com/

We can't have warnings especially in things outside of arch/. Doesn't
matter why.

The choices to fix are:

- Override DTC_FLAGS in drivers/misc/. You can set DTC_FLAGS_lan966x_pci

- Disable the check in dtc for overlays. We've done this for other cases.

- Add enough info into the overlay to avoid the warnings. This might
mean the overlay has to be applied up one node level. It is
duplicating a few things which are in the base tree. This is my
preference because it makes the overlay stand on its own. We'll have
the same issue with dtschema checks too if we don't do this.

Rob

