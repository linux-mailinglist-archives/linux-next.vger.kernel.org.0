Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52991229AF2
	for <lists+linux-next@lfdr.de>; Wed, 22 Jul 2020 17:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbgGVPFq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Jul 2020 11:05:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727880AbgGVPFp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Jul 2020 11:05:45 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3D47C0619DC
        for <linux-next@vger.kernel.org>; Wed, 22 Jul 2020 08:05:45 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id o22so1791369qtt.13
        for <linux-next@vger.kernel.org>; Wed, 22 Jul 2020 08:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RGlEkhcsZo3yhQXvjN0G+bmOOv4WJUp5U029tMuuyYg=;
        b=TaHrNGo0vX9p8V/a8lm0ySt7CsVnoSD6VsPJ+ZHw5/3XzTaHXum+uEEJNhhxBUw7xz
         mmpy3MgxQTOlnS7qSticTtoJFnxrKcB0v4bgF67rRG8ALv6V3prPwY4UQ61ULQEPiW7d
         fGVddSAaLcvTOnFIVytrgfb2Lt2Q5rc7KLuHKsci8sv6h/Uty2++ObGjwpo9CXCnQXkj
         6/jeCkZRq0KSMWZSxST07kWW6fGXdrKm2suORrbRZ7mtSduUSplay6gSECXy8YghAUPV
         ZrHwJZB2skAayNjFeyvDGFRe8MG6NryWipDSceAbDEIogR/7GtyW02yZsFGfUXhvRJtk
         77mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RGlEkhcsZo3yhQXvjN0G+bmOOv4WJUp5U029tMuuyYg=;
        b=bpx4Vxovtngy6lpnAAmYmcbN8/s3tolNhF8DHLaBAU5fbGTkzfLtXltdBgS+2OtshG
         +QAiyZm66fT1UqTTT0VQVSOfgAeBRHzql54DGwVzo7Q86rRzlIJYsh2PZ8qiXb1bARP7
         kTh46K0J861wboIU6DnVRY7e6Du2Ahnv66X8mPlWHjrC4K2rfsCUKgw144HRIdxCkdtV
         dt+x5duzaWXxpLmfzwr4u1dp04xWFxnfB/TwcXUVR593ood9nBbYDBxJFB+sMFFhrKfK
         v7q4hXG3fEhRxcmxYj+retfbxBdf8NKnzJyOBJDN5DP6kyPHMmXxqXBdAaxqA7B+AS02
         iCng==
X-Gm-Message-State: AOAM531TIY33I9veJcObu7G8xOv9jfXfxjXxBrU5TMgu79+t/QvRIQ7T
        +6pwpwygytpn+27OShNaVEdssbTR
X-Google-Smtp-Source: ABdhPJxXI6G+8WcU1OnSC4Ae68ENWwOcxciuh/ylA0DxS4Hi/2xUF+URjE3DxQfglGTPTZJ/yzVhOQ==
X-Received: by 2002:ac8:ac3:: with SMTP id g3mr34721068qti.178.1595430344491;
        Wed, 22 Jul 2020 08:05:44 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id 3sm97420qkm.117.2020.07.22.08.05.43
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2020 08:05:43 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id j1so1166621ybh.10
        for <linux-next@vger.kernel.org>; Wed, 22 Jul 2020 08:05:43 -0700 (PDT)
X-Received: by 2002:a25:df81:: with SMTP id w123mr51454810ybg.428.1595430342800;
 Wed, 22 Jul 2020 08:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <87wo2vwxq6.fsf@cloudflare.com> <20200722144212.27106-1-kuniyu@amazon.co.jp>
 <87v9ifwq2p.fsf@cloudflare.com>
In-Reply-To: <87v9ifwq2p.fsf@cloudflare.com>
From:   Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date:   Wed, 22 Jul 2020 11:05:06 -0400
X-Gmail-Original-Message-ID: <CA+FuTScto+Z_qgFxJBzhPUNEruAvKLSTL7-0AnyP-M6Gon_e5Q@mail.gmail.com>
Message-ID: <CA+FuTScto+Z_qgFxJBzhPUNEruAvKLSTL7-0AnyP-M6Gon_e5Q@mail.gmail.com>
Subject: Re: linux-next: manual merge of the bpf-next tree with the net tree
To:     Jakub Sitnicki <jakub@cloudflare.com>
Cc:     Kuniyuki Iwashima <kuniyu@amazon.co.jp>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        David Miller <davem@davemloft.net>,
        kernel-team <kernel-team@cloudflare.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Network Development <netdev@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jul 22, 2020 at 11:02 AM Jakub Sitnicki <jakub@cloudflare.com> wrote:
>
> On Wed, Jul 22, 2020 at 04:42 PM CEST, Kuniyuki Iwashima wrote:
> > Can I submit a patch to net tree that rewrites udp[46]_lib_lookup2() to
> > use only 'result' ?
>
> Feel free. That should make the conflict resolution even easier later
> on.

Thanks for the detailed analysis, Jakub.

Would it be easier to fix this wholly in bpf-next, by introducing
reuseport_result there?
