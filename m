Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04B5E27A742
	for <lists+linux-next@lfdr.de>; Mon, 28 Sep 2020 08:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725308AbgI1GOS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Sep 2020 02:14:18 -0400
Received: from verein.lst.de ([213.95.11.211]:34332 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725290AbgI1GOS (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Sep 2020 02:14:18 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 8B21167373; Mon, 28 Sep 2020 08:14:15 +0200 (CEST)
Date:   Mon, 28 Sep 2020 08:14:15 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Dave Airlie <airlied@gmail.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm tree
Message-ID: <20200928061415.GA15226@lst.de>
References: <20200928135405.73404219@canb.auug.org.au> <20200928060427.GA15041@lst.de> <CAPM=9txFX+M8O+-PCxAUnrSovXRHEZyRwOX2r3GUr7hP0A_o3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9txFX+M8O+-PCxAUnrSovXRHEZyRwOX2r3GUr7hP0A_o3A@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 28, 2020 at 04:08:36PM +1000, Dave Airlie wrote:
> Is this possible in drm-next now (it's 5.9.0-rc5 based)?
> 
> or will I need to get a stable shared git tree that goes into drm-next
> and you send to Linus early in the MR?

I think we'll need a stable branch.   Let me help Paul with the
conversion first, and once we are done I'll create a shared branch.
