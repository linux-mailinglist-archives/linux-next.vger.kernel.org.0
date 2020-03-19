Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A134E18B0E1
	for <lists+linux-next@lfdr.de>; Thu, 19 Mar 2020 11:05:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbgCSKFK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Mar 2020 06:05:10 -0400
Received: from mail-qt1-f174.google.com ([209.85.160.174]:43993 "EHLO
        mail-qt1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgCSKFK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Mar 2020 06:05:10 -0400
Received: by mail-qt1-f174.google.com with SMTP id l13so1221810qtv.10
        for <linux-next@vger.kernel.org>; Thu, 19 Mar 2020 03:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DZKMSyu0caMbSHPp7LnrnLmiKn3lBRmEg4h+wkqOnUU=;
        b=BpEFviSRmooc9XZIQNWWcH56jXjByIMgvkaAFQ8cvH4lLZgxhGwaXzIl60zP8DRmwn
         DPPm0k2Az7W4mL8BLhW+M3R9K6nigcnlPxOsGCW/oaCTtjVjyZeEr0vO/aPehoS01/Oh
         ENo//dV32jTSAB72ljRG8jgA7TvBlNUXtvNV4+mTO65GuQ5ieB6OqF24QmV5JtXr8Dz8
         CcEi4GhrbSs/LflvZSTxhG1YIOrrN5jblo3f2g4rn5oIYyUIkLHWCD6xAvMAd8dDcOVC
         dhldwlMQg7t/hzJqrNLCOsqAsojrxQUH5dXsYtJPI8Azh5GBB9y9GWtCtF+nJ4qYYu6y
         Wcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DZKMSyu0caMbSHPp7LnrnLmiKn3lBRmEg4h+wkqOnUU=;
        b=AiykIqqPWzVdqJWy/TO1u0KhuAqjuU5fMbJOXnbEtVyu2PnQjW5PP1FqxMiPIpNbAx
         mW5QCmgFghAc7Okv4d759D3Gch6nN10VcmqZMB1eros419TzJhdCnD429NQ4g64yIdJI
         QQusC689v3X7hd7Mt6vw2ZGaQQkDDuWBBrfGxUSbkZkKmGtPkqXnXdaW7rI4vwJNgTXv
         aWu5e8KYiSy3lsmIwI5AUmRG1LZhkmRMmihKEvaUwOchGlXX0ElQnlHQnMvRs7LVpMXn
         zRBaQs+9dHTfg0aMBPgSwZdFAK7U/VfudI5gsLMUhzsIo8tN7lNF1tTv577rAmOwTJUe
         8+oA==
X-Gm-Message-State: ANhLgQ2NFATPdzwfVw4bBXwvsJaoQeds1QFDJGzO6b54y9iNpxVwuvoY
        KltYH7cMLhjhh1vS8Ona4nMklrkoe75ejjHvcEYvBLKXfGhFHQ==
X-Google-Smtp-Source: ADFU+vuMZUNmHuO8pA2eRmRUw3dUYphV88bMzvu8AMT32PjuSE/flAciWm7En4pGfMzvNUmL9llFoxs481vC/LegKOc=
X-Received: by 2002:aed:3346:: with SMTP id u64mr1865938qtd.333.1584612308921;
 Thu, 19 Mar 2020 03:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200319190613.36d687a6@canb.auug.org.au>
In-Reply-To: <20200319190613.36d687a6@canb.auug.org.au>
From:   Greentime Hu <greentime.hu@sifive.com>
Date:   Thu, 19 Mar 2020 18:04:57 +0800
Message-ID: <CAHCEehJS-6ECNccFfLqoVhLQfpD4_c0qCyatVzpbHDuLpo2hUw@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the risc-v-fixes tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> =E6=96=BC 2020=E5=B9=B43=E6=9C=8819=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=884:06=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Hi all,
>
> In commit
>
>   3384b043ea15 ("riscv: fix the IPI missing issue in nommu mode")
>
> Fixes tag
>
>   Fixes: b2d36b5668f6 ("riscv: provide native clint access for M-mode")
>
> has these problem(s):
>
>   - Target SHA1 does not exist
>
> Maybe you meant
>
> Fixes: fcdc65375186 ("riscv: provide native clint access for M-mode")
>

Sorry. That's my bad.
Yes, I meant Fixes: fcdc65375186 ("riscv: provide native clint access
for M-mode")
