Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F21928F04C
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 12:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728242AbgJOKo3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 06:44:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgJOKo3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Oct 2020 06:44:29 -0400
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com [IPv6:2607:f8b0:4864:20::b43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2C30C0613D2
        for <linux-next@vger.kernel.org>; Thu, 15 Oct 2020 03:44:28 -0700 (PDT)
Received: by mail-yb1-xb43.google.com with SMTP id s89so1840016ybi.12
        for <linux-next@vger.kernel.org>; Thu, 15 Oct 2020 03:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=massaru-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xmBW7vKSBqJFsplZSHcanCRxnO5k2v4wYTo/MjdHXlA=;
        b=e/bUJWy7yaJf5qN+JzaRH3AABTJ1Th4jbeKJ3tKZLJkFZ2vtmY+ERE93D+7T1DNh4L
         6upIyieo4bBg2olNvfK8AfucvDw7dDBfXoL4BojBYIYNsfC7BkoX/UBmCk2usIq1VobJ
         c1cNXUXJqge0jeuNDDYwc4zPQQmpW0DmoCe9JqKBkydP/X/OWu1ZPF9Lx33+jdnnvnv+
         w+k7p2JxIG1WPVU+BRr/uRsTDVtyxYVY9l/C7vB5omMNAr1HIEhjDhrHNCFp3pMjkYTx
         yfPjVtHh+piZvKxKO1bn4IeMM/ctwsNGtWahD0es8z3MaHZ80vxII95UwGkvIBkTklSL
         seVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xmBW7vKSBqJFsplZSHcanCRxnO5k2v4wYTo/MjdHXlA=;
        b=nSu6wQ+4K9CyualtUJoA34jvwzxNxvLtZlH/0Q+62aGs1pqygdLDoBsMbTEyF4DyjZ
         ezY5/ItfWqzmuH/7jh5c8oPmbbWA2jfyrcDcAKXAsFfZV/VYuY8J9PgH8tFXKfdWMH2T
         KjNxIQdhqF9sdTxuX6liGV6EvMcntbfXiJ9jrPqrNdJDOk7zM4psljg1gWHQ1zYL1Q4u
         qCLOSeZnzWfwH9464/a9Enl7MAMLX1EO3lXm51PNkF5zuiFRSMNkpN10a9kZWNWp0UAx
         bavvnnv2cmPyxbKLud2SuUWVHAKHokawznVoAkXrNnDxvsMCBhR1Z/d29JWLsP0AT4Pp
         QbiQ==
X-Gm-Message-State: AOAM5307v9FRY0Cu6zVXCm2msXpNQaUcHNL2ccdp6CafgydwoHVW4gaV
        d9plJGDxAsNIkY/q0oSfYi9xosXli9v0aewF06WugxnKylcF1hkqP20=
X-Google-Smtp-Source: ABdhPJzaorlHpMux1sGJdkpcYchDncmTmIBPUqIgSO4TXEq3L8uG+EJnUpjKDR2t9DqXU+N6makw1sW31hdNaDemBBA=
X-Received: by 2002:a25:a484:: with SMTP id g4mr4150039ybi.112.1602758667745;
 Thu, 15 Oct 2020 03:44:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201015163056.56fcc835@canb.auug.org.au>
In-Reply-To: <20201015163056.56fcc835@canb.auug.org.au>
From:   Vitor Massaru Iha <vitor@massaru.org>
Date:   Thu, 15 Oct 2020 07:43:51 -0300
Message-ID: <CADQ6JjX0tg51M0FsD+DmAaDcnWB0wrihj4WCq_z6En=tzL=wcg@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the kunit-next tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Thu, Oct 15, 2020 at 2:31 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the kunit-next tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> lib/bitfield_kunit.c: In function 'test_bitfields_compile':
> lib/bitfield_kunit.c:136:21: warning: unsigned conversion from 'int' to 'u16' {aka 'short unsigned int'} changes value from '393216' to '0' [-Woverflow]
>   136 |  u16_encode_bits(0, 0x60000);
>       |                     ^~~~~~~
> At top level:
> lib/bitfield_kunit.c:129:20: warning: 'test_bitfields_compile' defined but not used [-Wunused-function]
>   129 | static void __init test_bitfields_compile(struct kunit *context)
>       |                    ^~~~~~~~~~~~~~~~~~~~~~
>
> Introduced by commit
>
>   d2585f5164c2 ("lib: kunit: add bitfield test conversion to KUnit")

I saw the problem, I will send the patch.

Thanks!
