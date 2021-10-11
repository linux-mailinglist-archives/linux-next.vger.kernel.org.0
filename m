Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ABC442881D
	for <lists+linux-next@lfdr.de>; Mon, 11 Oct 2021 09:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234672AbhJKHxe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Oct 2021 03:53:34 -0400
Received: from verein.lst.de ([213.95.11.211]:36227 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234657AbhJKHx1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 Oct 2021 03:53:27 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id B7E5968AFE; Mon, 11 Oct 2021 09:51:25 +0200 (CEST)
Date:   Mon, 11 Oct 2021 09:51:25 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Simon Ser <contact@emersion.fr>
Cc:     Christoph Hellwig <hch@lst.de>,
        Alex Deucher <alexdeucher@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20211011075125.GA11098@lst.de>
References: <20211008113116.4bdd7b6c@canb.auug.org.au> <jXLIcCYkgHdIQna5SW6W4GGHVG5By4-GXiaosbXyyaYXFNTH60nmH6twdxMYgM2X63FhEOyxU7Qh_vbKFywBKmUwp7l4DYXe_hTt86AS-ZM=@emersion.fr> <20211008192910.600a188d@canb.auug.org.au> <Dz13Vv6-f2sFL9b6FSyhY_PlgeJfAnCBSn_SLFYSVRmXevReQOCK7ZD_DRX2DsjHYb45cTPpnTC-aG-tFNU2AapS9qsQZQB_boozWiTz-dI=@emersion.fr> <CADnq5_NUkzK=uOJKn5tiaSSA0i=WPJZFZBSPDne8ooims8JkCQ@mail.gmail.com> <_POw9ikafXoqSFqiOb8SZb_uvRZ4okgD4qrl4EtJ0UBiQTV7pwV3pJIM20eIzmpuFWDeBF9NPD00r72ttX0mZZ0bNeH_J44MoaB-jfjrQSU=@emersion.fr> <20211011073348.GA10672@lst.de> <-6WWj2RSqFheia8o3VKtAiF3bELME9376cYzwiLSY1-E7p9nqfWNqJ5i86Q--BKXa3aolokj8g8nj2tQorzn0LXuD85tD_rXSfE5t1lsvBs=@emersion.fr> <20211011074316.GA10882@lst.de> <XrjqMK5E95uVkQJ-wCjostUwiUD_39UdfIJzQhmnSwZO3aStGYHAxf9QsACe2WZ6vUn08BoW5X5Ya-tazSy0Iwn2jLLrCQDKxlJ6uWXLGaA=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <XrjqMK5E95uVkQJ-wCjostUwiUD_39UdfIJzQhmnSwZO3aStGYHAxf9QsACe2WZ6vUn08BoW5X5Ya-tazSy0Iwn2jLLrCQDKxlJ6uWXLGaA=@emersion.fr>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 11, 2021 at 07:49:44AM +0000, Simon Ser wrote:
> Have you heard about the kernel no-regression rule? Here, we can't enable a new
> feature because that would regress user-space which mis-uses the kernel uAPI.

Then you can't enable the feature without an explicit opt-in from
userspace.  This ain't rocket science.

> If your reply wasn't aggressive, I don't know what it is.

If there is one thing I find agressive it is your extreme passive
aggressive behavior.
