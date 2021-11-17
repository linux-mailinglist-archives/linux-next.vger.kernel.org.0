Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C3AF45444B
	for <lists+linux-next@lfdr.de>; Wed, 17 Nov 2021 10:56:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235693AbhKQJ7I (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Nov 2021 04:59:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235590AbhKQJ7F (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Nov 2021 04:59:05 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19F3DC061764
        for <linux-next@vger.kernel.org>; Wed, 17 Nov 2021 01:56:07 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id s13so3502463wrb.3
        for <linux-next@vger.kernel.org>; Wed, 17 Nov 2021 01:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=INh6HyOjduNwr+THipvfT2va5n+J9kEUpBwFF2GnRqg=;
        b=A/rRhcd5gjqQU68+HdSr6CKkWsGCegqpQWYV98rnDTfntYQughZvw+wEa2eqPmBPjT
         37ExVdeZ9r3tuR4b/nSlF18BqPlHRNq1eZ0EffIF458sOIx3ADcsmCQKxwGdpB0W2t31
         NVNsOssrD8XHlQKanD1398hTaJh+0m2OdQUbd5HO4Kp2ZGK38djSEmr0vi5ba/ohiZ+A
         7HrGHit9UjBLI4nNm0NmkNmIUNPQa666ZN0mpXpASekISb9wnY0feHS5kKmLzTaLVf60
         5ZediIIq52WgfDmSyk9Klr4eM2kl26+A4HAQ+lxdHg0lv5dANn0JTyenCYPfxBzOoHFi
         YLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=INh6HyOjduNwr+THipvfT2va5n+J9kEUpBwFF2GnRqg=;
        b=6e5+d2E3HRcWWEVnfpavq9as2mRfrnOKdnhb+Xh6xTmogzq8oaratYzFmnFRryAHQp
         tbZN3uCNDSkgeDrmFI7jmjqmx5d46+M7Lx7MkC+Y8M4Fd86tkwQ4vJfpzeYo9H2eZ36O
         d3b4GIxJiltKKu8OSFQnkQ0UU6ymXxPwh6OU8/pR+8TOWjbLGITUGwAg/BKtO4jtb/VZ
         8NNR33YREjuExjcBmWVWtRvehA6U1GWTts0TvJvFHjma1SWgUSvhhjS/Uc5FjxZAS0N9
         TyGl6ZN9WFdVY4BrP+lwG6ACT4r/G5ktbDXHQ6S2Ercv5hq75rZPilGQtWlwRINiOct3
         VFBw==
X-Gm-Message-State: AOAM532RajJH6VEAUO/1X5GwZOf4XZkuhfpEine4N1ibRrMYM+2TIy6J
        oQ6QRkNilvxJSEHYfyuwWmbVfLcm1cnNmWCqtSHQCQ==
X-Google-Smtp-Source: ABdhPJyXAI0w3mu3AVyIBmAzrRQTfn6I6HpV5ME6sQ9EHxAQStAJjj+xW4x5vCxV0BsCveao69IgVoibMa1ZNvthSOE=
X-Received: by 2002:adf:e387:: with SMTP id e7mr18614017wrm.412.1637142965285;
 Wed, 17 Nov 2021 01:56:05 -0800 (PST)
MIME-Version: 1.0
References: <20211117135800.0b7072cd@canb.auug.org.au> <268ae204-efae-3081-a5dd-44fc07d048ba@infradead.org>
 <CAMuHMdUdA6cJkWWKypvn7nGQw+u=gW_oRNWB-=G8g2T3VixJFQ@mail.gmail.com>
 <CANn89iLXQWR_F6v39guPftY=jhs4XHsERifhZPOTjR3zDNkJyg@mail.gmail.com>
 <CAMuHMdXHo5boecN7Y81auC0y=_xWyNXO6tq8+U4AJq-z17F1nw@mail.gmail.com> <CANn89iKSZKvySL6+-gk7UGCowRoApJQmvUpYfiKChSSbxr=LYw@mail.gmail.com>
In-Reply-To: <CANn89iKSZKvySL6+-gk7UGCowRoApJQmvUpYfiKChSSbxr=LYw@mail.gmail.com>
From:   Eric Dumazet <edumazet@google.com>
Date:   Wed, 17 Nov 2021 01:55:51 -0800
Message-ID: <CANn89iLAu9QAgqS_qzZYSHLmmPdL_2uD0RSmtrq4mPgkWzV8hQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Nov 17 (uml, no IPV6)
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Netdev <netdev@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 17, 2021 at 1:50 AM Eric Dumazet <edumazet@google.com> wrote:

> I don't know, apparently on UM, csum_ipv6_magic() is only found in
> arch/x86/um/asm/checksum_32.h,
> no idea why...
>

Oh, maybe this is the missing part :

diff --git a/include/net/gro.h b/include/net/gro.h
index d0e7df691a807410049508355230a4523af590a1..9c22a010369cb89f9511d78cc322be56170d7b20
100644
--- a/include/net/gro.h
+++ b/include/net/gro.h
@@ -6,6 +6,7 @@
 #include <linux/indirect_call_wrapper.h>
 #include <linux/ip.h>
 #include <linux/ipv6.h>
+#include <net/ip6_checksum.h>
 #include <linux/skbuff.h>
 #include <net/udp.h>
