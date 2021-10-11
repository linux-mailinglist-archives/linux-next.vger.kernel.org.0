Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8282A4287FB
	for <lists+linux-next@lfdr.de>; Mon, 11 Oct 2021 09:43:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234493AbhJKHpS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Oct 2021 03:45:18 -0400
Received: from verein.lst.de ([213.95.11.211]:36203 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234317AbhJKHpS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 Oct 2021 03:45:18 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 825CB68AFE; Mon, 11 Oct 2021 09:43:16 +0200 (CEST)
Date:   Mon, 11 Oct 2021 09:43:16 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Simon Ser <contact@emersion.fr>
Cc:     Christoph Hellwig <hch@lst.de>,
        Alex Deucher <alexdeucher@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20211011074316.GA10882@lst.de>
References: <20211008113116.4bdd7b6c@canb.auug.org.au> <jXLIcCYkgHdIQna5SW6W4GGHVG5By4-GXiaosbXyyaYXFNTH60nmH6twdxMYgM2X63FhEOyxU7Qh_vbKFywBKmUwp7l4DYXe_hTt86AS-ZM=@emersion.fr> <20211008192910.600a188d@canb.auug.org.au> <Dz13Vv6-f2sFL9b6FSyhY_PlgeJfAnCBSn_SLFYSVRmXevReQOCK7ZD_DRX2DsjHYb45cTPpnTC-aG-tFNU2AapS9qsQZQB_boozWiTz-dI=@emersion.fr> <CADnq5_NUkzK=uOJKn5tiaSSA0i=WPJZFZBSPDne8ooims8JkCQ@mail.gmail.com> <_POw9ikafXoqSFqiOb8SZb_uvRZ4okgD4qrl4EtJ0UBiQTV7pwV3pJIM20eIzmpuFWDeBF9NPD00r72ttX0mZZ0bNeH_J44MoaB-jfjrQSU=@emersion.fr> <20211011073348.GA10672@lst.de> <-6WWj2RSqFheia8o3VKtAiF3bELME9376cYzwiLSY1-E7p9nqfWNqJ5i86Q--BKXa3aolokj8g8nj2tQorzn0LXuD85tD_rXSfE5t1lsvBs=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <-6WWj2RSqFheia8o3VKtAiF3bELME9376cYzwiLSY1-E7p9nqfWNqJ5i86Q--BKXa3aolokj8g8nj2tQorzn0LXuD85tD_rXSfE5t1lsvBs=@emersion.fr>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 11, 2021 at 07:39:52AM +0000, Simon Ser wrote:
> I don't understand. Can you elaborate why you think this commit is
> "utter crap"?

A kernel driver has absolutely no business making decissions based
on current->comm, which can be changed by any userspace process.  This
is kernel programming 101.

Independent of that a check for a specific program as the callers makes
no sense whatsoever as a given program and change over time.  This is
not even something kernel specific but something that ever software
engineer should do.

> I'd also appreciate if you could be a bit less aggressive. There's
> nothing "obvious" about this from my point of view.

I'm not agressive.  I'm just really disappointed by the amoubt of crap
that gets shovelled into the kernel and even more disappointed by the
abslutely lack of knowledge of some of the contributors.
