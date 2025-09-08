Return-Path: <linux-next+bounces-8236-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F47B49149
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 16:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1CA47AB4F8
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 14:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19137222568;
	Mon,  8 Sep 2025 14:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkkZp8lD"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41B71CAA7B;
	Mon,  8 Sep 2025 14:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757341414; cv=none; b=a9/QYBA6rnbJ5T2jj1J4nMpgXkjDzmM3NDucmWozA3/iMiIBABDMKtMBYiDP1FJh0Uo2j+9jJqcwlVC4Ot5OyxxpOc4bj2YvNLHuJeNWbsDyz5IN2F5VetRJoyt+146EYY8mhMDvrIDlNZbsY0kNVam4goSoGW6ykJ0gi4tca0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757341414; c=relaxed/simple;
	bh=MI8JwKVlgjxwoZ/OWhAJGNuMAzlXq6fYq3NQWnUSRO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OwDBj/KEBuNyZ3NJw4GlJf4338O1Oh4upbyG4hu1wHOhEJSaedAVMZ591DzMOz7lCp05zEfZELHJlULDWA4kTKdQ92upECHypcZgOXvqcZEcAYXSROPTQ2HyLXjHyqcdt0JgN9A4xubF1MHYNvog2hqmWPAZRhWOsIl87Ryy0CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkkZp8lD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70DB3C4CEFB;
	Mon,  8 Sep 2025 14:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757341413;
	bh=MI8JwKVlgjxwoZ/OWhAJGNuMAzlXq6fYq3NQWnUSRO8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TkkZp8lDzyy1zdShAEfnMZoaE8tZ2VPmLUS5cxtYhJttmMkxJop4bQyvOrP2LzgTw
	 HSfYlV0q6GAX93CJ1N06HVHirRHuEQTcPaU5J4AH2grrQzpas+2fw9TEqs0Nv4/zQY
	 QceoRKvTIgnvG4puYUK0zIoEDiWkwEdPPrNtdZjifpwzPgor6277KP8KhF/6OPcFQ1
	 TOeC/Rf4KqJuVvEdMCLq3avrZtPefg6BFMvSE0K3FZNfla2odL01Ft61Ed57AwqL1r
	 7HL4OOWegr73zR2p7voSvrg7kou1s6VGxQcqvq5wJZVGMJ8ipg8W8LALZJZH9wFxn9
	 C8Mt2lHQ/wsPw==
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-743814bcca2so3416293a34.0;
        Mon, 08 Sep 2025 07:23:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+Fho6YPOFMOFpzGbsqBRDfffwFcLu5cNbpiHEShdO2wH8FU4GTu5IHZFB3vEbNcf2A6gCfylTa7E/l3M=@vger.kernel.org, AJvYcCW0zmXq602hJ3Em48jXTdN3LNeU5LkRCXXIrfpthZt4O6nLX4B5DwA3YbANgK2bfpUBqlK4qUd++bShKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+gmN0OIrq5P1uMY8ujYeAovkfKs92It58y1QFHQhnegu4Zi98
	z3JqwT0DjCJ75Flr5mVy+sH0uoYtGWbthynnfR5yWtmY04zIshwTArzVGY29okFcE7v/lQq+Q5B
	NFzehXGrRlN2mmMC+iEvuHbBvVbrBEmk=
X-Google-Smtp-Source: AGHT+IF9bYyMEPg+K2eZ8ZPR1Gz5tCt7YFEQ4qRFBQGht9gAyG3y1TIrVCSRxeUxusZioQelr4hA7sAtWsdd5CjXyeg=
X-Received: by 2002:a05:6830:34a6:b0:745:4de7:f425 with SMTP id
 46e09a7af769-746d91e7a2cmr5968388a34.3.1757341412826; Mon, 08 Sep 2025
 07:23:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908175135.4215c780@canb.auug.org.au> <5937399.DvuYhMxLoT@workhorse>
In-Reply-To: <5937399.DvuYhMxLoT@workhorse>
From: Chanwoo Choi <chanwoo@kernel.org>
Date: Mon, 8 Sep 2025 23:22:55 +0900
X-Gmail-Original-Message-ID: <CAGTfZH3JyMGvjWni1Ge+a1=4nRPL30a84DCamj1AtXRLRMgzeQ@mail.gmail.com>
X-Gm-Features: Ac12FXyu7PKtdUcolHGypS1g5A9zFkMN3MyJqkWdBV12ZmUN1WzZdBv9xAv0Hnk
Message-ID: <CAGTfZH3JyMGvjWni1Ge+a1=4nRPL30a84DCamj1AtXRLRMgzeQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the bitmap tree with the devfreq tree
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Yury Norov <yury.norov@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

On Mon, Sep 8, 2025 at 8:26=E2=80=AFPM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Monday, 8 September 2025 09:51:35 Central European Summer Time Stephen=
 Rothwell wrote:
> > Hi all,
> >
> > Today's linux-next merge of the bitmap tree got a conflict in:
> >
> >   drivers/devfreq/event/rockchip-dfi.c
> >
> > between commit:
> >
> >   7d9e29ed3f8e ("PM / devfreq: rockchip-dfi: add support for LPDDR5")
> >
> > from the devfreq tree and commit:
> >
> >   414054a0bc1f ("PM / devfreq: rockchip-dfi: switch to FIELD_PREP_WM16 =
macro")
> >
> > from the bitmap tree.
>
> Yeah, basically both of these were by me and landed at the same time
> through different trees; they were developed at different times and
> the reviews just happened to conclude at the same moment. The reason
> why they go through different trees is that the bitmap changes are
> part of a large refactor across several drivers to make them use a
> shared macro instead of reinventing their own, whereas the devfreq
> side of the changes is functional changes to add LPDDR5 support and
> also fix the cycle count on RK3588.
>
> >
> > I have no idea how to fix this up, so I dropped the changes from the
> > bitmap tree for today.  Someone should supply me with the appropriate
> > resolution.
> >
>
> Dropping the bitmap tree changes of this driver is fine by me. I can
> send a rebased patch of that for the next merge window to do the move
> from the driver's own macro to the shared macro. The functional
> change in the devfreq tree is more important to get in.

I think that you need to ask to drop your patch[1] on bitmap tree.
[1] 414054a0bc1f ("PM / devfreq: rockchip-dfi: switch to FIELD_PREP_WM16 ma=
cro")

Before fixing this merge conflict, I'll drop the patches related to patch[2=
].
[2] 7d9e29ed3f8e ("PM / devfreq: rockchip-dfi: add support for LPDDR5")

After resolving the merge conflict, I'll apply them again.

--=20
Best Regards,
Chanwoo Choi
Samsung Electronics

