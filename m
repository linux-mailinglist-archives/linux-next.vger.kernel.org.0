Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B783B69FDD4
	for <lists+linux-next@lfdr.de>; Wed, 22 Feb 2023 22:44:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232842AbjBVVoF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Feb 2023 16:44:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232554AbjBVVoE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Feb 2023 16:44:04 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9D5C32517
        for <linux-next@vger.kernel.org>; Wed, 22 Feb 2023 13:44:03 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id ck15so37371262edb.0
        for <linux-next@vger.kernel.org>; Wed, 22 Feb 2023 13:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8oYWKIc1S3uxITVpxd8tWdXuh6CEoVI7L8XjQ7W6G1A=;
        b=HhUHBtTjub8KdQHhqu1fxHUgmYd9w+ceHrZK9zRemdaggPWtv2iGPX6Cql9YcsRCzv
         ew7JVcXnoVO+4cDmGI33ch5+YbLrwqZNZFUyY25F96N4PowEGSsYLjkRYiFYdoihT7td
         zjBWY+nzFImFuPwTQP0fDvzUFTGKWAxaIS278=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8oYWKIc1S3uxITVpxd8tWdXuh6CEoVI7L8XjQ7W6G1A=;
        b=DIAtSNNUXfLeWsJUUKlAZc5LMA26P1yAEO8cFy+mbpPwl4rTir0OawQwFmVjXTCP95
         mNEWjdhmu6F8RupcbeVpRj/HocIakSu/oC7RZx83pGXnm+C6UlDnUpNckZlT2zyAFNyQ
         B3Cgu6l0iv74TKwbS5AIkle+++SfJgYuE42bv1GFTbzg4tIDmT4Tk+CLXKW/xqB3o2Ff
         NLxNmwtHXgVPMW5L53ZxCb3BQ+iLeE+c46uENgREbOPEgGOkhlzR3R5gjdKFtIpdpNp1
         g03CpTCdaD6iFC3SqBAsJeH8vm+7NH3+ev1FjGMEyiS4u8oR7UyDyCkP6Bq9k9quudc+
         sstg==
X-Gm-Message-State: AO0yUKVwUbMPfyu5kGR9sS+Uv/uZWCnsHUV21n8DczSmzInHic9IES8V
        tKc11D3w2XBJI3yqf+qQa8xum0Eexj7OsFxfKwQ=
X-Google-Smtp-Source: AK7set9mP1u7SFaZKIDIAvn+jz6GJUvCMNy2kiWTPH2mH/eDQNom/Ep0+Kl6PgLzFh2m/nInRnXEOw==
X-Received: by 2002:a17:907:212d:b0:882:2027:c8e2 with SMTP id qo13-20020a170907212d00b008822027c8e2mr15367608ejb.56.1677102241703;
        Wed, 22 Feb 2023 13:44:01 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a9-20020a170906468900b008dd76b67ae6sm2914301ejr.175.2023.02.22.13.44.01
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 13:44:01 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id h16so36295599edz.10
        for <linux-next@vger.kernel.org>; Wed, 22 Feb 2023 13:44:01 -0800 (PST)
X-Received: by 2002:a50:f694:0:b0:4ad:6d57:4e16 with SMTP id
 d20-20020a50f694000000b004ad6d574e16mr4649056edn.5.1677102240934; Wed, 22 Feb
 2023 13:44:00 -0800 (PST)
MIME-Version: 1.0
References: <20230223083932.0272906f@canb.auug.org.au>
In-Reply-To: <20230223083932.0272906f@canb.auug.org.au>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 22 Feb 2023 13:43:44 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjXpth1kQRCeAXhxoAmsr8dnLLW9KJ0haMiXmdF6-hFfw@mail.gmail.com>
Message-ID: <CAHk-=wjXpth1kQRCeAXhxoAmsr8dnLLW9KJ0haMiXmdF6-hFfw@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the bpf tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Huacai Chen <chenhuacai@loongson.cn>,
        bpf <bpf@vger.kernel.org>, Networking <netdev@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Feb 22, 2023 at 1:39 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> The following commit is also in Linus Torvalds' tree as a different commit
> (but the same patch):

Yup, that was very intentional to keep the fallout of the problem on
random architectures minimal.

         Linus
