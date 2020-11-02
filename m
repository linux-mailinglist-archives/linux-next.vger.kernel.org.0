Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD7002A35DA
	for <lists+linux-next@lfdr.de>; Mon,  2 Nov 2020 22:15:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgKBVPu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Nov 2020 16:15:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51556 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725833AbgKBVPt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Nov 2020 16:15:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604351747;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=n8nC5dm2QcEcDOmnZj7Db/s9oem13/v8vyPc3hhuf6g=;
        b=MePtIhso8KIg7t34ZImu3wD7IFw6yQez2Vj8Cqk+chCAoWIEHP+/V92XG1iUKbG+gIM6ff
        gkr9hxVvnAB/hh7F4uGOA+ugCzT19SKS/bNwCBJc3Ba1qWtZa1bhdDyuOVo4Uc8fpmS1IP
        ydCXnBkVRbRuqlX15MgIDQeLgsefqDg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-4m5bZXnGOneDcOI2Osgarg-1; Mon, 02 Nov 2020 16:15:41 -0500
X-MC-Unique: 4m5bZXnGOneDcOI2Osgarg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40A8610199AC;
        Mon,  2 Nov 2020 21:15:39 +0000 (UTC)
Received: from ovpn-112-12.rdu2.redhat.com (ovpn-112-12.rdu2.redhat.com [10.10.112.12])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DC88475121;
        Mon,  2 Nov 2020 21:15:34 +0000 (UTC)
Message-ID: <0bd01646f4b429e89359d0618d25f5d6cf92c4f5.camel@redhat.com>
Subject: Re: [PATCH] s390: add support for TIF_NOTIFY_SIGNAL
From:   Qian Cai <cai@redhat.com>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
        linux-kernel@vger.kernel.org, peterz@infradead.org,
        oleg@redhat.com, tglx@linutronix.de,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Date:   Mon, 02 Nov 2020 16:15:34 -0500
In-Reply-To: <b7b2fa41-fab2-7fd4-f10f-9c352bc9c692@kernel.dk>
References: <20201101173153.GC9375 () osiris>
         <362e3645e2c0891309c07e244a147f0c32f106da.camel@redhat.com>
         <54c02fa6-8c8a-667f-af99-e83a1f150586@kernel.dk>
         <d60d24de6b7c9b948333e4e288452fe0a39d2380.camel@redhat.com>
         <b7b2fa41-fab2-7fd4-f10f-9c352bc9c692@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 2020-11-02 at 12:50 -0700, Jens Axboe wrote:
> Ah, but that's because later patches assume that TIF_NOTIFY_SIGNAL is
> always there once all archs have been converted. If you just want to back
> out that patch, you'll need to just revert this one:
> 
> commit 82ef6998ed9d488e56bbfbcc2ec9adf62bf78f08
> Author: Jens Axboe <axboe@kernel.dk>
> Date:   Fri Oct 9 16:04:39 2020 -0600
> 
>     kernel: remove checking for TIF_NOTIFY_SIGNAL
> 
> as well and I suspect it should build.

No, at the minimal, I'll need to revert those to build successfully.

7b074c15374c io_uring: remove 'twa_signal_ok' deadlock work-around
eb48a0f216fa kernel: remove checking for TIF_NOTIFY_SIGNAL
c634e6b63a81 signal: kill JOBCTL_TASK_WORK
f8b667db31a3 io_uring: JOBCTL_TASK_WORK is no longer used by task_work
4c3d9c3b415a s390: add support for TIF_NOTIFY_SIGNAL

Then, it will fix the boot issue as well.




