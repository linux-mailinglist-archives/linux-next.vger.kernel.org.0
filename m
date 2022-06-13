Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCC1F54A2BE
	for <lists+linux-next@lfdr.de>; Tue, 14 Jun 2022 01:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbiFMXeM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jun 2022 19:34:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233513AbiFMXeL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Jun 2022 19:34:11 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3322E3191C
        for <linux-next@vger.kernel.org>; Mon, 13 Jun 2022 16:34:10 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id q15so8903584wrc.11
        for <linux-next@vger.kernel.org>; Mon, 13 Jun 2022 16:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xGYiKa6mXP0iZOXOQm7kCvDLrx3D14bnw7gw1UJaDHY=;
        b=Q+qj4tgzGC0W3T7fwxnpleP1RH8nFiUZ+6PltDb2osyo96YS0SaAnAL3gcP90t3uW9
         bVhf20bfbfCis0UBI4wK4VvpBeUJcK2hur0uOIuFfFULpyXglo5fZog21X1vnbEpj8R0
         f6+zigzJU2zRTaJoqvIYo5YzbnY8d+1qrYUFqmo4w+mQlSNvXR9i6eJaLInvHYOHb/aY
         6fiB6f/aniXoNg2wTLroaIxPaB3oJKzuSYKh5lCz+fTdshNh365tkVBZeJ4xIDEF/5mP
         8GqWXaXYU08FP4yV7maeP7Pw2orru0HBjntNANVH9SAmRzpHbIVUC2XlLdPpRG+uV9IO
         438A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xGYiKa6mXP0iZOXOQm7kCvDLrx3D14bnw7gw1UJaDHY=;
        b=JP2J+LZODIw2dm1KqNIKj+TO8/hH1IP4BvJ/1d7W5EnTvS4BFJNAT2IDDo0L/GxUFq
         g4bGaoRBmDEuA5nhTBB5nH5gMMBoyFVfJHZD8ife12hTqfVV+ixxIQQY4H+BM4+gZqxw
         tPS5fSZgj9mEGFI+wwbZKW9mpeMgjm56E3bHGCR+vm18YZLbmiXzuOhqebvYHepY3yO1
         HmHOfdiDbv0yF7VHKBLuMTpJ/2rCs1C8ekFIJ1MpGcfBiw9TPRi7nJ/mwCvCYLwl1eNb
         CzdbBlAdFHYC9FSjx/h6oauyVC2xsjDksCNbC0RIJIseIFldMjGrtdcWhbxlPqa2s5KK
         O8MA==
X-Gm-Message-State: AJIora8xdMu4oaotuhdj00P5bwiSaG23TqzyPwcEk8cqXcej2pB+HQB5
        Fr512iJ7fPkxF7j2ITzEQWe8wgE/XWA6kRurB++XSaOHJQ==
X-Google-Smtp-Source: AGRyM1vupl+waimCKX6BURP8frkXJ72r3v3eqI+2I8C6U17IP2g6be79mtg7PPeYV5f/qLsklq4q5mwUcv6/2+XPdpw=
X-Received: by 2002:a05:6000:1008:b0:210:3e9a:324c with SMTP id
 a8-20020a056000100800b002103e9a324cmr1964810wrx.89.1655163248675; Mon, 13 Jun
 2022 16:34:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220614082425.415adffc@canb.auug.org.au>
In-Reply-To: <20220614082425.415adffc@canb.auug.org.au>
From:   Paul Moore <paul@paul-moore.com>
Date:   Mon, 13 Jun 2022 19:33:58 -0400
Message-ID: <CAHC9VhT9QUdfu5TCZcAuzcC8wBaA8VR2MKWiQE3RWEv5M65tJA@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the selinux tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jun 13, 2022 at 6:24 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   e81ee824e8a1 ("docs: selinux: add '=' signs to kernel boot options")
>
> Fixes tag
>
>   Fixes: ^1da177e4c3f4 ("Linux-2.6.12-rc2")
>
> has these problem(s):
>
>   - No SHA1 recognised
>
> Also, I don't think that is a relevent or useful Fixes tag anyway.

Good point Stephen.  I just dropped the tag in the offending commit
and did a force push back to selinux/next; sorry for the noise.

-- 
paul-moore.com
