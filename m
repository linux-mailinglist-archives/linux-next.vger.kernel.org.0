Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA45343270
	for <lists+linux-next@lfdr.de>; Sun, 21 Mar 2021 13:31:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhCUMa5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Mar 2021 08:30:57 -0400
Received: from ozlabs.org ([203.11.71.1]:58413 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229840AbhCUMa4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 21 Mar 2021 08:30:56 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F3H6K5QSzz9sSC;
        Sun, 21 Mar 2021 23:30:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1616329854;
        bh=At0Z8aWmgu7qu0pmLP6lB84s/HhVQBTf0u8fIQCc9C0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=QCylja3G+/AIOHZlJ0VG3XhsXd0Or0z96nmg7md8Aobbqjf6yqN8jdkG8jWO76ghQ
         Mq1BdgFvd0zWSajzjLyPEu+763wRhFonN4mOnyp14bq/lcnYFfQAK509RtKCBz9XOZ
         gOaimDWVIjacoeYTFPi4mgotbvbjVJWAbZEv/g5eeroWidSI4q2HCjxNxW22jSc7C1
         bqnCIjLECceT/m03/4ny2ewgwNlP5PM+qJ9fSAgGusXScQID0JzTqr8OCa+5Cu9FQi
         fLKqlcBDaq8XWEnnek4h4CivohSP9nSvjmpxhIWDvaZ4kMLFEm+hFh+Lp1+Jv7olhH
         JzfW1T0LQ6B3w==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Stephen Rothwell <sfr@rothwell.id.au>
Cc:     Heiko Carstens <hca@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Daniel Axtens <dja@axtens.net>
Subject: Re: linux-next: Tree for Mar 19
In-Reply-To: <CANiq72mp4=4FZ_Vq1pzA07vkJ1mKFKOFFhcVoH9zTJjLtrBc9A@mail.gmail.com>
References: <20210319175950.509fcbd0@canb.auug.org.au>
 <YFS1h6h+71sRlwFR@osiris> <20210320162734.1630cc55@elm.ozlabs.ibm.com>
 <CANiq72nKJBVsuvqr17qa0xnkQTUz9aaAGRi8SfXZAn-G=RYQXw@mail.gmail.com>
 <CANiq72n+-9vtpvvHTD=QzpskCbZEvTWhDXUaHrkwsJn4M3fjXg@mail.gmail.com>
 <CANiq72mp4=4FZ_Vq1pzA07vkJ1mKFKOFFhcVoH9zTJjLtrBc9A@mail.gmail.com>
Date:   Sun, 21 Mar 2021 23:30:44 +1100
Message-ID: <8735woit8r.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:
> On Sat, Mar 20, 2021 at 7:49 AM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
>>
>> Reproduced on s390. However, under defconfig, one also needs to revert
>> kernel/livepatch/core.c to avoid triggering the assert, i.e.:
>
> Stephen: I will put this in rust-next so that others don't see
> problems on their side and test it with a allmodconfig for powerpc and
> s390 -- is it Monday the next round, right?

Yes. But Monday in UTC+11 :)

cheers
