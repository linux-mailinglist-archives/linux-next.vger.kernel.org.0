Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF213229AEA
	for <lists+linux-next@lfdr.de>; Wed, 22 Jul 2020 17:02:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731856AbgGVPC1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Jul 2020 11:02:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730346AbgGVPC0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Jul 2020 11:02:26 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F07E3C0619DE
        for <linux-next@vger.kernel.org>; Wed, 22 Jul 2020 08:02:25 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id q6so2840742ljp.4
        for <linux-next@vger.kernel.org>; Wed, 22 Jul 2020 08:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=PihvrkcIdS9+OJBOnU38h7yqxzd2Wqd+kwsRkrJ6J2Y=;
        b=RNHbSFFPJwnAFASGuINzCqJII/5IgjdU8e7BUEvXcf1eqAmEktuEVJKVESGGzgK7Ys
         h55rvylSRZ9KlfZdAbq+Avva/GTpLfNS+WhPzIrOCUAaAaKW5qq6UYU+gy9HXm9Quszp
         KmDuDLxKfGnkDo9egr99I5bqA97enE6crWenk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=PihvrkcIdS9+OJBOnU38h7yqxzd2Wqd+kwsRkrJ6J2Y=;
        b=tkzCofrn2PxLDFm85WYvmrVRGVJsj5Ub8aryuHpMal7uq7USwhuWRc1goAKyujL+P4
         XoA/oaXcbSw7i/4NJPFZlIthTg+mIZj4oZCrtMxb9VIUWln/Uo4WoAUySyStmZseXFzi
         4jBo4kN82SZIhWtonU6UJ9iHorFh0/QyYrX2IStC6EFbLlpQ41lgoYe7ZM+4UzzaypuV
         fEgBlezDsWzDoFN8MSUaTn5eULLwT/Mi/1HW5Qdj4chFpHx2kmKxnaGGcEuHkyP6H5eZ
         pBrpPKCmOFUO7Fxu8PcRlr5g3MVRlNR3rksxQ/cOEikT21kj69UpSv5KiT+l938tkBoz
         uL6A==
X-Gm-Message-State: AOAM530bIEkw9THdoclx5RDP3HeiRJ+k8g8Dbw9ez4f1j3hlnJvLDdQH
        xVvTXcmwpm8qiQwEUOuR2XDEEg==
X-Google-Smtp-Source: ABdhPJyDawdPxmJ6OAHeMXj2O5Vbp5F3TvglkcvQxvPpg0TysBMH3BD+mhxwlvotlSwEljW6jSKHGQ==
X-Received: by 2002:a2e:9b8d:: with SMTP id z13mr15240620lji.463.1595430144039;
        Wed, 22 Jul 2020 08:02:24 -0700 (PDT)
Received: from cloudflare.com ([2a02:a310:c262:aa00:b35e:8938:2c2a:ba8b])
        by smtp.gmail.com with ESMTPSA id e20sm123227lja.137.2020.07.22.08.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2020 08:02:23 -0700 (PDT)
References: <87wo2vwxq6.fsf@cloudflare.com> <20200722144212.27106-1-kuniyu@amazon.co.jp>
User-agent: mu4e 1.1.0; emacs 26.3
From:   Jakub Sitnicki <jakub@cloudflare.com>
To:     Kuniyuki Iwashima <kuniyu@amazon.co.jp>
Cc:     ast@kernel.org, daniel@iogearbox.net, davem@davemloft.net,
        kernel-team@cloudflare.com, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org, netdev@vger.kernel.org,
        sfr@canb.auug.org.au, willemb@google.com
Subject: Re: linux-next: manual merge of the bpf-next tree with the net tree
In-reply-to: <20200722144212.27106-1-kuniyu@amazon.co.jp>
Date:   Wed, 22 Jul 2020 17:02:22 +0200
Message-ID: <87v9ifwq2p.fsf@cloudflare.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jul 22, 2020 at 04:42 PM CEST, Kuniyuki Iwashima wrote:
> Can I submit a patch to net tree that rewrites udp[46]_lib_lookup2() to
> use only 'result' ?

Feel free. That should make the conflict resolution even easier later
on.

Thanks,
-jkbs
