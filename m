Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF51428813
	for <lists+linux-next@lfdr.de>; Mon, 11 Oct 2021 09:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233968AbhJKHvt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Oct 2021 03:51:49 -0400
Received: from mail-4317.proton.ch ([185.70.43.17]:24413 "EHLO
        mail-4317.proton.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234542AbhJKHvs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Oct 2021 03:51:48 -0400
Date:   Mon, 11 Oct 2021 07:49:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail; t=1633938587;
        bh=WottzwwsmtSODAi8XiRezxONYGKj6wTrYEkENppM8hw=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=lO+NYS5v/w6KZ+fy4jNw6BmlhjsbBQQd7xH1GS1pAWkbcF5aoRb4p7/EFB6SFtkBA
         Q2x7LMXmoRbV5BtbYklyOUZPhKss6LOgX+IBJxHmdBxImuocpIBUhZb2hTkeJ/V377
         K69kprN65FfKz7lM1sc8ByT1xx11H04PCWi1faSx3Q7HGw6pHICyKOZkuQOi+vwNCK
         anasamzJ7XxX2F6ZWjnLTh5cE6wtO1hFt1pEni/h0YeEKm8XkkNfJyK4wILxlaSR2K
         /88UrBH0GTuzqVfhMxbUhgcd7wmRFnxdK83uHa+j1PfGFyet4n/y6xW3J0gDJJYg/T
         XymlTB/gvyTxw==
To:     Christoph Hellwig <hch@lst.de>
From:   Simon Ser <contact@emersion.fr>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
Message-ID: <XrjqMK5E95uVkQJ-wCjostUwiUD_39UdfIJzQhmnSwZO3aStGYHAxf9QsACe2WZ6vUn08BoW5X5Ya-tazSy0Iwn2jLLrCQDKxlJ6uWXLGaA=@emersion.fr>
In-Reply-To: <20211011074316.GA10882@lst.de>
References: <20211008113116.4bdd7b6c@canb.auug.org.au> <jXLIcCYkgHdIQna5SW6W4GGHVG5By4-GXiaosbXyyaYXFNTH60nmH6twdxMYgM2X63FhEOyxU7Qh_vbKFywBKmUwp7l4DYXe_hTt86AS-ZM=@emersion.fr> <20211008192910.600a188d@canb.auug.org.au> <Dz13Vv6-f2sFL9b6FSyhY_PlgeJfAnCBSn_SLFYSVRmXevReQOCK7ZD_DRX2DsjHYb45cTPpnTC-aG-tFNU2AapS9qsQZQB_boozWiTz-dI=@emersion.fr> <CADnq5_NUkzK=uOJKn5tiaSSA0i=WPJZFZBSPDne8ooims8JkCQ@mail.gmail.com> <_POw9ikafXoqSFqiOb8SZb_uvRZ4okgD4qrl4EtJ0UBiQTV7pwV3pJIM20eIzmpuFWDeBF9NPD00r72ttX0mZZ0bNeH_J44MoaB-jfjrQSU=@emersion.fr> <20211011073348.GA10672@lst.de> <-6WWj2RSqFheia8o3VKtAiF3bELME9376cYzwiLSY1-E7p9nqfWNqJ5i86Q--BKXa3aolokj8g8nj2tQorzn0LXuD85tD_rXSfE5t1lsvBs=@emersion.fr> <20211011074316.GA10882@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Monday, October 11th, 2021 at 09:43, Christoph Hellwig <hch@lst.de> wrot=
e:

> On Mon, Oct 11, 2021 at 07:39:52AM +0000, Simon Ser wrote:
> > I don't understand. Can you elaborate why you think this commit is
> > "utter crap"?
>
> A kernel driver has absolutely no business making decissions based
> on current->comm, which can be changed by any userspace process.  This
> is kernel programming 101.
>
> Independent of that a check for a specific program as the callers makes
> no sense whatsoever as a given program and change over time.  This is
> not even something kernel specific but something that ever software
> engineer should do.

Have you heard about the kernel no-regression rule? Here, we can't enable a=
 new
feature because that would regress user-space which mis-uses the kernel uAP=
I.

This isn't unheard of. Core drm already detects Xorg with current->comm, an=
d
force-disables atomic KMS.

> > I'd also appreciate if you could be a bit less aggressive. There's
> > nothing "obvious" about this from my point of view.
>
> I'm not agressive.  I'm just really disappointed by the amoubt of crap
> that gets shovelled into the kernel and even more disappointed by the
> abslutely lack of knowledge of some of the contributors.

If your reply wasn't aggressive, I don't know what it is.
