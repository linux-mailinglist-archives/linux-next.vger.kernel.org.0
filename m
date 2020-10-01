Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 337A1280089
	for <lists+linux-next@lfdr.de>; Thu,  1 Oct 2020 15:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732020AbgJANxy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Oct 2020 09:53:54 -0400
Received: from verein.lst.de ([213.95.11.211]:48806 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732018AbgJANxy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 1 Oct 2020 09:53:54 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id B1DB068B02; Thu,  1 Oct 2020 15:53:50 +0200 (CEST)
Date:   Thu, 1 Oct 2020 15:53:50 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Dave Airlie <airlied@linux.ie>, Christoph Hellwig <hch@lst.de>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the akpm tree with the drm-intel
 tree
Message-ID: <20201001135350.GA14869@lst.de>
References: <20201001203917.43d46a3d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201001203917.43d46a3d@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 01, 2020 at 08:39:17PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the akpm tree got a conflict in:
> 
>   drivers/gpu/drm/i915/gem/i915_gem_pages.c
> 
> between commit:
> 
>   4caf017ee937 ("drm/i915/gem: Avoid implicit vmap for highmem on x86-32")
>   ba2ebf605d5f ("drm/i915/gem: Prevent using pgprot_writecombine() if PAT is not supported")
> 
> from the drm-intel tree and patch:
> 
>   "drm/i915: use vmap in i915_gem_object_map"
> 
> from the akpm tree.
> 
> I fixed it up (I just dropped the changes in the former commits) and

Sigh.  The solution is a bit more complicated, but I just redid my
patches to not depend on the above ones.  I can revert back to the old
version, though.  Andrew, let me know what works for you.
