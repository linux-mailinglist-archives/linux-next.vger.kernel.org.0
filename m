Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A79B398320
	for <lists+linux-next@lfdr.de>; Wed,  2 Jun 2021 09:36:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231691AbhFBHiZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Jun 2021 03:38:25 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:37578 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230478AbhFBHiY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Jun 2021 03:38:24 -0400
Received: from relay2.suse.de (unknown [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 8AA2E2193F;
        Wed,  2 Jun 2021 07:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1622619401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0917ad2i3Ztse06hY+fiGMjTziVATbwhHA51+YY+UNI=;
        b=FHB+gVpYz8Y/48DpAaSsrtrnHZx2GRqvjqV1B2FreAs9Mn8UVhrVXjbK0x4puKNXkhH8Bm
        xZtdI/LWj42ZMQOd4R2f21LFugmepD7j0LE5qpMRhGDc3r01jOZCEkWANEfHussBPgHb2T
        12oC3uS7vegkBpRdov0jIJ4phjQ+VR8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1622619401;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0917ad2i3Ztse06hY+fiGMjTziVATbwhHA51+YY+UNI=;
        b=iUb9IqRKO5iZa/+6IPk0UPUm7bAE3GWCrHczTSQSxHEcyQRi2+ub/7yqsgYv0LQQ8KIfbB
        KJ4quoWxWReJnsCg==
Received: from alsa1.suse.de (alsa1.suse.de [10.160.4.42])
        by relay2.suse.de (Postfix) with ESMTP id 835FEA3B88;
        Wed,  2 Jun 2021 07:36:41 +0000 (UTC)
Date:   Wed, 02 Jun 2021 09:36:41 +0200
Message-ID: <s5h8s3syaye.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Takashi Iwai <tiwai@suse.de>,
        Dongliang Mu <mudongliangabcd@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the sound-current tree
In-Reply-To: <20210602170946.37a2c6ec@canb.auug.org.au>
References: <20210602170946.37a2c6ec@canb.auug.org.au>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 02 Jun 2021 09:09:46 +0200,
Stephen Rothwell wrote:
> 
> Hi all,
> 
> In commit
> 
>   b3531c648d87 ("ALSA: control led: fix memory leak in snd_ctl_led_register")
> 
> Fixes tag
> 
>   Fixes: a135dfb5de1 ("ALSA: led control - add sysfs kcontrol LED marking layer")
> 
> has these problem(s):
> 
>   - SHA1 should be at least 12 digits long
> 
> This is probably not worth rebasing to fix, but can be avoided in the
> future by setting core.abbrev to 12 (or more) or (for git v2.11 or later)
> just making sure it is not set (or set to "auto").

My bad, I must have overlooked the warning at applying.

Since it's the top commit and quite fresh (just an hour old), I'll
refresh the tree.


thanks,

Takashi
