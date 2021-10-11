Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12B5B4287DC
	for <lists+linux-next@lfdr.de>; Mon, 11 Oct 2021 09:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234734AbhJKHmB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Oct 2021 03:42:01 -0400
Received: from mail-4018.proton.ch ([185.70.40.18]:33687 "EHLO
        mail-4018.proton.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234635AbhJKHly (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Oct 2021 03:41:54 -0400
Date:   Mon, 11 Oct 2021 07:39:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail; t=1633937992;
        bh=fvSI5zEw/wB73FKqhTzKmuwOI4zNq2JMpem9rmfHPr4=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=VnFeTWc6w0KT5d7S8Dt6IhHntq2RGpT+q7fqPW4ggl+yRxm7mFqEV0QnjY/XIrK9e
         qBdUVF47GUmvb3QqFkZDw6QBZEj9GDdpnSL/kfCF8LXkLBwofJ5BYLHZynxf1iQQ0/
         ioUZ1cJDCgTVt+HuuEfz5l72pd0fgFgml7sQoIh69sjxda657Ou97I+mQ8ZNf26/An
         UH5U1N2snxVei/X1QLntlgZYbQ+6ywfXCFTrMyzE/iP1TFBancMCIsw+u6DLigvyyR
         Bxs37q4rCSoU1ierCKY3q5d8Lazmjd/BnxCFLDOZN1rHUsricx5CoKwB1fCO6Kr60a
         G7Wa4CMY+Wm9w==
To:     Christoph Hellwig <hch@lst.de>
From:   Simon Ser <contact@emersion.fr>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
Message-ID: <-6WWj2RSqFheia8o3VKtAiF3bELME9376cYzwiLSY1-E7p9nqfWNqJ5i86Q--BKXa3aolokj8g8nj2tQorzn0LXuD85tD_rXSfE5t1lsvBs=@emersion.fr>
In-Reply-To: <20211011073348.GA10672@lst.de>
References: <20211008113116.4bdd7b6c@canb.auug.org.au> <jXLIcCYkgHdIQna5SW6W4GGHVG5By4-GXiaosbXyyaYXFNTH60nmH6twdxMYgM2X63FhEOyxU7Qh_vbKFywBKmUwp7l4DYXe_hTt86AS-ZM=@emersion.fr> <20211008192910.600a188d@canb.auug.org.au> <Dz13Vv6-f2sFL9b6FSyhY_PlgeJfAnCBSn_SLFYSVRmXevReQOCK7ZD_DRX2DsjHYb45cTPpnTC-aG-tFNU2AapS9qsQZQB_boozWiTz-dI=@emersion.fr> <CADnq5_NUkzK=uOJKn5tiaSSA0i=WPJZFZBSPDne8ooims8JkCQ@mail.gmail.com> <_POw9ikafXoqSFqiOb8SZb_uvRZ4okgD4qrl4EtJ0UBiQTV7pwV3pJIM20eIzmpuFWDeBF9NPD00r72ttX0mZZ0bNeH_J44MoaB-jfjrQSU=@emersion.fr> <20211011073348.GA10672@lst.de>
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

On Monday, October 11th, 2021 at 09:33, Christoph Hellwig <hch@lst.de> wrot=
e:

> On Fri, Oct 08, 2021 at 06:07:33PM +0000, Simon Ser wrote:
>
> > Would it be reasonable to re-export get_mm_exe_file? amdgpu uses it her=
e:
> >
> > https://gitlab.freedesktop.org/agd5f/linux/-/commit/0d4da915c7098eca2aa=
6f559f42e33b5e9c7c5e8
>
> Seriously? No, it obviously not. Unexporting it is important to catch
> utter crap like in that commit which should have never made it into a
> maintainer tree.

I don't understand. Can you elaborate why you think this commit is
"utter crap"?

I'd also appreciate if you could be a bit less aggressive. There's
nothing "obvious" about this from my point of view.
