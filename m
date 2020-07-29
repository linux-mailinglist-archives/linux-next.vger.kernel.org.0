Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CBBA231F62
	for <lists+linux-next@lfdr.de>; Wed, 29 Jul 2020 15:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgG2NgC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 09:36:02 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:43688 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726391AbgG2NgC (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Jul 2020 09:36:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1596029761;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UoAZNhHf1hQmOQfH+hbOw0J7WwqGHOBNlKUEao3PZkI=;
        b=MUEib7tFlEUUyxxpcbnRzIOWU6WpD7YocNkZqsVvHtnh3DyqaNRugj4taEpMu+U7s4QNgI
        PzcFibAbWq4+g007YydTz/CVsxoZedbAgQqsgNGCdo3ZsHPSJSfJeIwmetfwhuhBQEihO9
        XUW6XbMp1qc4Q+BDgcfqP36/71JYVd8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-c2B0SQTRMF2tdMPs1dspbA-1; Wed, 29 Jul 2020 09:35:50 -0400
X-MC-Unique: c2B0SQTRMF2tdMPs1dspbA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1B141005504;
        Wed, 29 Jul 2020 13:35:47 +0000 (UTC)
Received: from llong.remote.csb (ovpn-116-40.rdu2.redhat.com [10.10.116.40])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C5F4F5DA7A;
        Wed, 29 Jul 2020 13:35:45 +0000 (UTC)
Subject: Re: [PATCH 0/2] locking/qspinlock: Break qspinlock_types.h header
 loop
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Petr Mladek <pmladek@suse.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org
References: <20200729210311.425d0e9b@canb.auug.org.au>
 <20200729114757.GA19388@gondor.apana.org.au>
 <20200729122807.GA7047@gondor.apana.org.au>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <ed62ba67-0e1d-3fee-8c09-7750d5690be5@redhat.com>
Date:   Wed, 29 Jul 2020 09:35:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200729122807.GA7047@gondor.apana.org.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/29/20 8:28 AM, Herbert Xu wrote:
> This miniseries breaks a header loop involving qspinlock_types.h.
> The issue is that qspinlock_types.h includes atomic.h, which then
> eventually includes kernel.h which could lead back to the original
> file via spinlock_types.h.
>
> The first patch moves ATOMIC_INIT into linux/types.h while the second
> patch actuallys breaks the loop by no longer including atomic.h
> in qspinlock_types.h.
>
> Cheers,

This patch series looks good to me. I just wonder if we should also move 
ATOMIC64_INIT() to types.h for symmetry purpose. Anyway,

Acked-by: Waiman Long <longman@redhat.com>

