Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97E1528F831
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 20:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388756AbgJOSKj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 14:10:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388746AbgJOSKj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Oct 2020 14:10:39 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0569C061755
        for <linux-next@vger.kernel.org>; Thu, 15 Oct 2020 11:10:38 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id n142so2994344ybf.7
        for <linux-next@vger.kernel.org>; Thu, 15 Oct 2020 11:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=massaru-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5PhVZHmSAkVDi2ogyHK0EhTkDiMWIN7m6nHd8c1uY3Q=;
        b=cYlUpmq//9xDGkGRpPGzvuBiysmf4Sa+vmD4NuyZqMFPi4f/7dl2YQthsTMJtuC8Pz
         /jqo3N+YcaoYaGbCzw66AEpqTSsPGGp9ddJiZA8/MKNVKcuCQAPidxwLF6TOYW5ISiL2
         J08kHzdUmKVE3ZOoQt3nT+jDvW9+2oRJRr77KEkhxv9lQPtYPYlyY5xGTNO/VXaBAt4y
         NWe2VZ5DPQMYTqE5KKULTab1iCGodgij7HL/anVgcgd2kXJFwtF5AY1omFH9/p+XM9CX
         EZZ1Md4sdNlKlpyMA3qbkkLZ9kslogR2RUcXX8FofF0sArpCm9bFQfEjWf4i9H50nnOB
         A7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5PhVZHmSAkVDi2ogyHK0EhTkDiMWIN7m6nHd8c1uY3Q=;
        b=Fwdd8xwy/GMxKdhY/Sgz8YkpgPvXwpQJABo1HK0VkLj4v8d05GH38aN5AggK7yrNv1
         V5UhQPWyl0Mc5xMOgQrya0jW2IEU5resOaVgYN6VzRmjPgEzMK6twdm34Y/qfrfEDoi4
         OAjfT3n7VVD0biFU3V02irheGlxKwTeuO0pBohvaw9qmRqaXKWiA8SjFcauVPrCIFKEJ
         jrar+2cw3rZTqRatpjKolEtHaMTgf/PgH7zg7MrVO5F6zZhotpc22J/HieG3GwGpGz+Z
         J33RK9ylm27AU+9/7Fs86nb9DVh4xFB2oYiztqIbw3UCRWv4uLiylWjtlfh6+9Rz4mdv
         HSJw==
X-Gm-Message-State: AOAM530g5KQ1UURzRpQdZNg4iROKMosKQSwp2NivUclmdiPLb7bAMBq/
        OpL2Tocn1OdkkbDxPyyC98CtoEGvgzonGaMkFyDKkg==
X-Google-Smtp-Source: ABdhPJw92HvjxKGrluc4VRbZUK6rUVc5Op4ZmOOUA8suDBU/ap0LqjNnfxa4gamQnN+FxjFpp0GEUoSyVZ8ghA97Lvk=
X-Received: by 2002:a25:2311:: with SMTP id j17mr7384931ybj.362.1602785438220;
 Thu, 15 Oct 2020 11:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20201015163056.56fcc835@canb.auug.org.au> <CADQ6JjX0tg51M0FsD+DmAaDcnWB0wrihj4WCq_z6En=tzL=wcg@mail.gmail.com>
 <2759fa81-630e-6395-b8e1-c743fb533700@linuxfoundation.org>
In-Reply-To: <2759fa81-630e-6395-b8e1-c743fb533700@linuxfoundation.org>
From:   Vitor Massaru Iha <vitor@massaru.org>
Date:   Thu, 15 Oct 2020 15:10:02 -0300
Message-ID: <CADQ6JjUpaNTSx-GBdk8U2_jAG5FgdyRGpg_=h2XiYm=+UOruRg@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the kunit-next tree
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Shuah,


I already sent the patch:
https://patchwork.kernel.org/project/linux-kselftest/patch/20201015120851.229242-1-vitor@massaru.org

On Thu, Oct 15, 2020 at 3:01 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> On 10/15/20 4:43 AM, Vitor Massaru Iha wrote:
> > Hi Stephen,
> >
> > On Thu, Oct 15, 2020 at 2:31 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >>
> >> Hi all,
> >>
> >> After merging the kunit-next tree, today's linux-next build (x86_64
> >> allmodconfig) produced this warning:
> >>
> >> lib/bitfield_kunit.c: In function 'test_bitfields_compile':
> >> lib/bitfield_kunit.c:136:21: warning: unsigned conversion from 'int' to 'u16' {aka 'short unsigned int'} changes value from '393216' to '0' [-Woverflow]
> >>    136 |  u16_encode_bits(0, 0x60000);
> >>        |                     ^~~~~~~
> >> At top level:
> >> lib/bitfield_kunit.c:129:20: warning: 'test_bitfields_compile' defined but not used [-Wunused-function]
> >>    129 | static void __init test_bitfields_compile(struct kunit *context)
> >>        |                    ^~~~~~~~~~~~~~~~~~~~~~
> >>
> >> Introduced by commit
> >>
> >>    d2585f5164c2 ("lib: kunit: add bitfield test conversion to KUnit")
> >
> > I saw the problem, I will send the patch.
> >
>
> Please send the fix in as soon as possible. I will go ahead and send the
> pull request and will apply the fix in rc2.
>
> thanks,
> -- Shuah
>
