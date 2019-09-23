Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD6D6BB6B1
	for <lists+linux-next@lfdr.de>; Mon, 23 Sep 2019 16:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439857AbfIWO2Y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Sep 2019 10:28:24 -0400
Received: from merlin.infradead.org ([205.233.59.134]:42678 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437634AbfIWO2X (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Sep 2019 10:28:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=pfO0w2VZ1NL504GmbRCCM2xrQ+ksHz0wYBTzCBYK0Ec=; b=fjRlOStJKkZCqSjwxVhWIXfaq
        ncf21egJn851tlhDPNJsd2Ajs3gOhR2yRDfM3PvVxg7ti3UaFif+5b5Tfu25i1lNlpAlAU/rAc/op
        erhysCFHFpvQLieLXnIlqrjmrLHpG8SVbg2q8TA7hDXVSfglNpBsnuNVjzmCbGCTHKR+8q8oyKmcZ
        pXIm4R954n/XKhFQixdHsd+4hGDN+9yxqZnEdnq5CQpm4y3fm5bwT2LhrgVlvceBzG/7k4hPbPyFr
        xrAgxtldFO5ulVHs80iZPUfDK2KWPz33AqdkdoE9SqGX0KU0Yhg40UNARyMwD18vXBN3QatmfHHJx
        1sBbCsG5A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iCPK4-0004A7-Bf; Mon, 23 Sep 2019 14:28:17 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7935E301A7A;
        Mon, 23 Sep 2019 16:27:29 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 78B0820D80D44; Mon, 23 Sep 2019 16:28:14 +0200 (CEST)
Date:   Mon, 23 Sep 2019 16:28:14 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        chris@chris-wilson.co.uk
Subject: Re: linux-next: Tree for Sep 18 (objtool)
Message-ID: <20190923142814.GB2369@hirez.programming.kicks-ass.net>
References: <20190918221053.GV2596@sirena.co.uk>
 <be0fb087-5fb4-a790-90dd-cc2af62419e7@infradead.org>
 <20190923092024.GI2349@hirez.programming.kicks-ass.net>
 <20190923124901.3ayejcis5ijrsvbx@treble>
 <20190923133352.GI2332@hirez.programming.kicks-ass.net>
 <20190923141657.p6kpqro3q4p4umwi@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190923141657.p6kpqro3q4p4umwi@treble>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 23, 2019 at 09:16:57AM -0500, Josh Poimboeuf wrote:
> On Mon, Sep 23, 2019 at 03:33:52PM +0200, Peter Zijlstra wrote:
> > On Mon, Sep 23, 2019 at 07:49:01AM -0500, Josh Poimboeuf wrote:
> > > On Mon, Sep 23, 2019 at 11:20:24AM +0200, Peter Zijlstra wrote:
> > > > On Wed, Sep 18, 2019 at 09:04:21PM -0700, Randy Dunlap wrote:
> > > > > On 9/18/19 3:10 PM, Mark Brown wrote:
> > > > > > Hi all,
> > > > > > 
> > > > > > Changes since 20190917:
> > > > > > 
> > > > > 
> > > > > on x86_64:
> > > > > 
> > > > > drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: i915_gem_execbuffer2_ioctl()+0x2fb: call to gen8_canonical_addr() with UACCESS enabled
> > > > 
> > > > I'm thinking that comes from:
> > > > 
> > > > 				offset = gen8_canonical_addr(offset & ~UPDATE);
> > > > 				if (unlikely(__put_user(offset, &urelocs[r-stack].presumed_offset))) {
> > > > 
> > > > however, per commit 6ae865615fc4 (and 2a418cf3f5f1) the compiler really
> > > > should not be sticking gen8_canonical_addr() after __uaccess_begin().
> > > > 
> > > > /me puzzled...
> > > 
> > > I think you're looking at the wrong code.  It has user_access_begin/end
> > > around it:
> > > 
> > > 		if (!user_access_begin(user_exec_list, count * sizeof(*user_exec_list)))
> > > 			goto end;
> > > 
> > > 		for (i = 0; i < args->buffer_count; i++) {
> > > 			if (!(exec2_list[i].offset & UPDATE))
> > > 				continue;
> > > 
> > > 			exec2_list[i].offset =
> > > 				gen8_canonical_addr(exec2_list[i].offset & PIN_OFFSET_MASK);
> > > 			unsafe_put_user(exec2_list[i].offset,
> > > 					&user_exec_list[i].offset,
> > > 					end_user);
> > > 		}
> > > end_user:
> > > 		user_access_end();
> > > 
> > 
> > Oh, Duh... Yeah, so the alternative to your solution is to do 2 loops.
> > Not sure which would be better.
> 
> I like your idea better, makes the fix more localized and shrinks the
> uaccess window.  Something like so (not even compile tested):

At which point we should probably also Cc Chris who caused all this
with commit:

  2889caa92321 ("drm/i915: Eliminate lots of iterations over the execobjects array")

> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index b5f6937369ea..406af374f728 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -2847,6 +2847,11 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
>  			u64_to_user_ptr(args->buffers_ptr);
>  		unsigned int i;
>  
> +		for (i = 0; i < args->buffer_count; i++) {
> +			exec2_list[i].offset =
> +				gen8_canonical_addr(exec2_list[i].offset & PIN_OFFSET_MASK);
> +		}
> +
>  		/* Copy the new buffer offsets back to the user's exec list. */
>  		/*
>  		 * Note: count * sizeof(*user_exec_list) does not overflow,
> @@ -2862,8 +2867,6 @@ i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
>  			if (!(exec2_list[i].offset & UPDATE))
>  				continue;
>  
> -			exec2_list[i].offset =
> -				gen8_canonical_addr(exec2_list[i].offset & PIN_OFFSET_MASK);
>  			unsafe_put_user(exec2_list[i].offset,
>  					&user_exec_list[i].offset,
>  					end_user);
