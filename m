Return-Path: <linux-next+bounces-277-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF1F80950A
	for <lists+linux-next@lfdr.de>; Thu,  7 Dec 2023 23:05:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15EA41F2106C
	for <lists+linux-next@lfdr.de>; Thu,  7 Dec 2023 22:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75A5840D0;
	Thu,  7 Dec 2023 22:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZ7Kf+Qa"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2F2840C4
	for <linux-next@vger.kernel.org>; Thu,  7 Dec 2023 22:05:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B9FC433CA;
	Thu,  7 Dec 2023 22:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701986741;
	bh=yBOixJQ1eF1hddNoJxG7LtdyuY6vJ5WLNmSrwlgp4wo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lZ7Kf+QaAtNfOvuJpVxhwqHMta+fKOgpz2Z9ArWpVnF2JtG2Qxp3gi54bYhrQbUBr
	 AU4pu4XoT179ntcBcWCgtmfm1CU8RF+gXyY6d5lHfxjYNkxAyVae2DXxbdzJdiYY/j
	 3tvGmFBl6vpojhij2iN83pcJK2zi93fO7DXxb4GuDrC3F53f6wOnRR5ysi+gKGJotW
	 rO9i/9/61Ylel6B+Bxmd9k/oaJkzcN2maaHddY2zA9ePVtO2kKhl7JBdezIjarHqFJ
	 q7MyThsH63PR8NehrljSPqzeaIgzX/IuHr/+vBhtF/J5Ls8tjrzAghnWTdzTnOhkH2
	 2f+WMvcqIHE1Q==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50bf2d9b3fdso1732024e87.3;
        Thu, 07 Dec 2023 14:05:41 -0800 (PST)
X-Gm-Message-State: AOJu0Yy0lF4t1sIEyqocVpH8PKVIny3rFG3iPLvoHgUNsQeKQUXoutJA
	c9nrscIRG5l5KWO6tM124Iq+drNFlI29r+Cv4A==
X-Google-Smtp-Source: AGHT+IHQkQcg5qrcR88HIPcJlgbksfcxgMOojfI1MFj6MnrTmN95a+4BrWUc8lbvOUDGpYPJEyYyzhxLLZYmEodEpdI=
X-Received: by 2002:a05:6512:b93:b0:50c:2253:15f7 with SMTP id
 b19-20020a0565120b9300b0050c225315f7mr632120lfv.23.1701986739317; Thu, 07 Dec
 2023 14:05:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207125737.5e7553e3@canb.auug.org.au> <CAL_JsqKXo+Cr=9s=dt1kCQeMadJ_cnuSpm06zmvK8yd-vd2X3g@mail.gmail.com>
 <20231208075847.6bbd23b8@canb.auug.org.au>
In-Reply-To: <20231208075847.6bbd23b8@canb.auug.org.au>
From: Rob Herring <robh@kernel.org>
Date: Thu, 7 Dec 2023 16:05:27 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKyqe827YRyqZnqcVghhuAuvWoiS4U7uR8wwYoGj3=9KA@mail.gmail.com>
Message-ID: <CAL_JsqKyqe827YRyqZnqcVghhuAuvWoiS4U7uR8wwYoGj3=9KA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the devicetree tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 2:58=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>
> Hi Rob,
>
> On Thu, 7 Dec 2023 09:11:22 -0600 Rob Herring <robh@kernel.org> wrote:
> >
> > I'm sending out fixes for all these. I want to get the final patch
> > ("of: Stop circularly including of_device.h and of_platform.h") for
> > all this in next to get some better build coverage and catch any new
> > drivers added. But if it is dropped for every new driver that breaks,
> > I'll never get it in. Can you fix these up or just leave them broken?
> > I can keep the fixes in my tree until they get applied by the
> > corresponding subsystem.
>
> These dependencies between trees are impossible to handle.  Please if
> you really need the final patch in, then you must put all the necessary
> fixes in the same branch.  There is no telling what order Linus (or I)
> will merge the interdependent branches.
>
> The alternative is to spray the needed fixes out to the other
> subsystems and then put the final patch in after the merge window
> closes or the next release.

Yes, that's what I've been doing since July and plan to do for the
final patch. The final patch can't wait a cycle because then we'll
just have more moles to wack. There's a couple of dependencies that
still haven't been picked up (seems Sparc is unmaintained), so I'm
going to send those along. I'll carry any further fixes until they I
see they are applied.

> I cannot "just leave them broken" because that will interfere with
> other's trying to get their work done. I will try fix up the newly
> added drivers if they are obvious, but in the case of these include file
> cleanups, that can be quite difficult sometimes.

The simple (but not completely correct) fix is usually just add of.h
and platform_device.h. There could be a case of needing of_platform.h
instead of of_device.h or vice-versa, but those should all be fixed
and rare in new code.

Thanks,
Rob

