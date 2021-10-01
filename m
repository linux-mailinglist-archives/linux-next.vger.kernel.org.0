Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA8C41F22C
	for <lists+linux-next@lfdr.de>; Fri,  1 Oct 2021 18:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354749AbhJAQfn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 1 Oct 2021 12:35:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353926AbhJAQfn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 1 Oct 2021 12:35:43 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDE69C061775
        for <linux-next@vger.kernel.org>; Fri,  1 Oct 2021 09:33:58 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id u32so21701552ybd.9
        for <linux-next@vger.kernel.org>; Fri, 01 Oct 2021 09:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AxBkrEppzydL210mtHWMUESMTp84ObWX/0Vf0yddPjU=;
        b=JgoPJYU8gzLKBEorGnZaC8itHJ+Kr5HICaxYAecF1g+gcDGHoS9OZBme/pYtyQijuw
         Si9mnyOfupciXd3pD34K1GB0JPDg5Ukk1/BmOBL+/Nry/tl62PS4a1y8HcBrDxEEDTqe
         BS1Na8oNnFVn57TXHpfmjfPe7N4JomaYVVBud+SurIWKwR7TYbq6jK/h9YL5+8w+h+ry
         sSc4pcKJESG1MFVUwgZYtbl98Wzts5LOWyl94lf8xxgIwmoE4/6ggjNK/nwLYqryCEIB
         3opJoIo+f4mjqE4mckBQfH5Abe2X1fc2tAaX/RwTDVdMwhXjpTWPbQ/Rmls7ef2KLDBj
         bUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AxBkrEppzydL210mtHWMUESMTp84ObWX/0Vf0yddPjU=;
        b=Fp0qTgC0qc789JH6+2kihQFqtRLcRAZyXtDNcAqm2H52o3QfD91LXiP92/EBCfh1nc
         0lU3MGLyVAyde+M2+3+AtdjRLoAm724K4DqzZrwh/L8XaGkKO6ONM+0VWkkNKVdXSFu0
         QwYPzDyLpiU85ID4AtNKgyka1d3FzIP7EV8wxN77BfeWfJVmauryIzA131hPUVoNf1dt
         hb3PvAH2x5teaWZXYpPP2QdHXQ/mPT3xo5wOWltmJTMSSz8atVVL1Ez7OKp/LQlN9WYk
         8rf1jEHlknORZPT282qL9meS0HGuZKsowALyhtw6b2AksTBnbbK9kMui17nq7ofCquoV
         bMEg==
X-Gm-Message-State: AOAM531dn6NQJHPy2gZwNWT/aJET6RhYPvFh6J8i+ZJVNGI5VN1/diTs
        X3jGb1gP5SaN/nvHdNj8HKzrac0lC82HMXNpG5MbIw==
X-Google-Smtp-Source: ABdhPJyVSZ7Gl2qu4VLLdN6Snrjo8+LMCte9xV3fsvsNKx32GVyIvvxbhrLS7SQ00RcpzY/4/kWQzzwaO6YCPZGcx7Q=
X-Received: by 2002:a25:2b07:: with SMTP id r7mr6338025ybr.296.1633106037560;
 Fri, 01 Oct 2021 09:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211001171842.7c9482a7@canb.auug.org.au>
In-Reply-To: <20211001171842.7c9482a7@canb.auug.org.au>
From:   Eric Dumazet <edumazet@google.com>
Date:   Fri, 1 Oct 2021 09:33:46 -0700
Message-ID: <CANn89iJ-ufDKs_msNSHYOUtPGwXAiHxtkgStCadSqhD8GZJZ_w@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 1, 2021 at 12:18 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Building Linus' tree, today's linux-next build (htmldocs) produced
> this warning:
>
> include/net/sock.h:533: warning: Function parameter or member 'sk_peer_lock' not described in 'sock'
>
> Introduced by commit
>
>   35306eb23814 ("af_unix: fix races in sk_peer_pid and sk_peer_cred accesses")


OK, I will fix this, thank you.
