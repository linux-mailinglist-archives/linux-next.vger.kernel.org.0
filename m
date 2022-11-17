Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D79E62E305
	for <lists+linux-next@lfdr.de>; Thu, 17 Nov 2022 18:29:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234005AbiKQR3l (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Nov 2022 12:29:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234843AbiKQR3j (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Nov 2022 12:29:39 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 390FB7818E;
        Thu, 17 Nov 2022 09:29:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E3B12B8215F;
        Thu, 17 Nov 2022 17:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247F7C433D6;
        Thu, 17 Nov 2022 17:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668706175;
        bh=eP0obEedNmCU+3WRO5YqBI0IHqVuqsqrydnsSJjg1j4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sllfVATZjCa6yOz90J0T7QyfcT6SqYJSFsCZ19V/xKlravDDKowxvZn79EPL90YdM
         bNf5XqSGsEqCP3WF41gmVNy/L73znrnBQWvdUYj7NWovpegvWr34NeRHIZ+oNlwTSj
         2u5gWTO9ZQGWwrsEhbDTID+gHxxuYBAkg7O8WxJAxmCZkq2y9amKRdNxrlp3fwXtT+
         wpFOnF6eSraUNf37Av9C4ozLet7Qh1nAquOxlAnN5SWgrHucV6gzYinjVrL9XqPiDF
         +yTqntmyELfK9NZYvrhBoAQs0NmmoUTnU0WWvLz41HWLlI5NSnBEgWybuzu1zol0t7
         Tth03XKFQ9sMw==
Date:   Thu, 17 Nov 2022 10:29:33 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Maxime Ripard <maxime@cerno.tech>, llvm@lists.linux.dev
Subject: Re: linux-next: manual merge of the drm-misc tree with the origin
 tree
Message-ID: <Y3ZvffZiR+SgtY6h@dev-arch.thelio-3990X>
References: <20221116105702.746ce3cf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116105702.746ce3cf@canb.auug.org.au>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Wed, Nov 16, 2022 at 10:57:02AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the drm-misc tree got a conflict in:
> 
>   drivers/gpu/drm/vc4/vc4_hdmi.c
> 
> between commit:
> 
>   682f99b8ae88 ("drm/vc4: hdmi: Take our lock to reset the link")
> 
> from the origin tree and commits:
> 
>   d218750805a3 ("drm/vc4: hdmi: Pass vc4_hdmi to vc4_hdmi_supports_scrambling()")
>   0a99962c0dbf ("drm/vc4: hdmi: Fix pointer dereference before check")
> 
> from the drm-misc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/gpu/drm/vc4/vc4_hdmi.c
> index d7fcc7a4c082,6b223a5fcf6f..000000000000
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@@ -349,12 -348,9 +348,13 @@@ static int vc4_hdmi_reset_link(struct d
>   	if (!crtc_state->active)
>   		return 0;
>   
>  +	mutex_lock(&vc4_hdmi->mutex);
>  +
> - 	if (!vc4_hdmi_supports_scrambling(encoder)) {
> + 	vc4_hdmi = connector_to_vc4_hdmi(connector);
>  -	if (!vc4_hdmi_supports_scrambling(vc4_hdmi))
> ++	if (!vc4_hdmi_supports_scrambling(vc4_hdmi)) {
>  +		mutex_unlock(&vc4_hdmi->mutex);
>   		return 0;
>  +	}
>   
>   	scrambling_needed = vc4_hdmi_mode_needs_scrambling(&vc4_hdmi->saved_adjusted_mode,
>   							   vc4_hdmi->output_bpc,

This resolution is not quite right, as pointed out by clang:

    drivers/gpu/drm/vc4/vc4_hdmi.c:351:14: error: variable 'vc4_hdmi' is uninitialized when used here [-Werror,-Wuninitialized]
            mutex_lock(&vc4_hdmi->mutex);
                        ^~~~~~~~
    ./include/linux/mutex.h:187:44: note: expanded from macro 'mutex_lock'
    #define mutex_lock(lock) mutex_lock_nested(lock, 0)
                                               ^~~~
    drivers/gpu/drm/vc4/vc4_hdmi.c:322:27: note: initialize the variable 'vc4_hdmi' to silence this warning
            struct vc4_hdmi *vc4_hdmi;
                                     ^
                                      = NULL
    1 error generated.

Obviously, the assignment of vc4_hdmi should be before mutex_lock().

Cheers,
Nathan
