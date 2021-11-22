Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7332A459813
	for <lists+linux-next@lfdr.de>; Mon, 22 Nov 2021 23:59:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbhKVXCj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Nov 2021 18:02:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbhKVXCi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Nov 2021 18:02:38 -0500
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09F97C061574;
        Mon, 22 Nov 2021 14:59:31 -0800 (PST)
Date:   Mon, 22 Nov 2021 23:59:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1637621967;
        bh=EvGI/fUt1aKiCPxhJx9Kx5hMVRHzzc2WoLWX82JIhyw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mgXo5nCFDhTx1mYtOfBJxdrBnQ0w+3M2dTWU3e1QWKp5OG4ewJHi1+2S2FyguMC30
         KhHeI+vVpgsQdv9lCPNa5gD6SDdCenJcxJoNqcLmBWFqUXq3QlZdnJ7Ky+s1u2p+8H
         EvXZYNKKn8a0cneuQ8XBr6JCufkYOpXn5rEhvkew=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the hid tree
Message-ID: <d617396a-20b7-41fd-bcf4-b5854a3c2e7d@t-8ch.de>
References: <20211123081723.4263f8c1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211123081723.4263f8c1@canb.auug.org.au>
Jabber-ID: thomas@t-8ch.de
X-Accept: text/plain, text/html;q=0.2, text/*;q=0.1
X-Accept-Language: en-us, en;q=0.8, de-de;q=0.7, de;q=0.6
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 2021-11-23 08:17+1100, Stephen Rothwell wrote:
> In commit
> 
>   3e6a950d9836 ("HID: input: set usage type to key on keycode remap")
> 
> Fixes tag
> 
>   Fixes: bcfa8d1457 ("HID: input: Add support for Programmable Buttons")
> 
> has these problem(s):
> 
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").

Thanks for the pointer. I'll make sure to do this correctly in the future.
Maybe this should be part of checkpatch.pl?

> Fixes tag
> 
>   Fixes: f5854fad39 ("Input: hid-input - allow mapping unknown usages")
> 
> has these problem(s):
> 
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").

Thomas
