Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C170212369
	for <lists+linux-next@lfdr.de>; Thu,  2 Jul 2020 14:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728911AbgGBMgH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Jul 2020 08:36:07 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:21955 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728861AbgGBMgH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Jul 2020 08:36:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593693366;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zoS32aEetNA7WukhLGFWUUUslXaekp29CK8PuqfIdFc=;
        b=BwYGfco5Tgal0NuoX8X4wYCWHIYrwkQ+a8ss+iK/8lNdfTF2/yvbD/dskEP6YuyQ70hGeM
        xiFv3y/9DVgancxrP/6B7iJ5uyKMmK6NzE0uV+V4yXiKSrG4VP4yj9k+RgpPvCp1AWJCsx
        gremsgqCz23qzHdaWlvBpz/5Diomcd8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-LX71wF1AMamum0V7EvPErQ-1; Thu, 02 Jul 2020 08:36:04 -0400
X-MC-Unique: LX71wF1AMamum0V7EvPErQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6A47106B243;
        Thu,  2 Jul 2020 12:35:57 +0000 (UTC)
Received: from treble (ovpn-117-134.rdu2.redhat.com [10.10.117.134])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 44A4378800;
        Thu,  2 Jul 2020 12:35:57 +0000 (UTC)
Date:   Thu, 2 Jul 2020 07:35:55 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Miroslav Benes <mbenes@suse.cz>
Subject: Re: linux-next: Tree for Jun 23 (objtool (2))
Message-ID: <20200702123555.bjioosahrs5vjovu@treble>
References: <20200623162820.3f45feae@canb.auug.org.au>
 <61df2e8f-75e8-d233-9c3c-5b4fa2b7fbdc@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <61df2e8f-75e8-d233-9c3c-5b4fa2b7fbdc@infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jun 23, 2020 at 08:06:07AM -0700, Randy Dunlap wrote:
> On 6/22/20 11:28 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20200622:
> > 
> 
> on x86_64:
> 
> arch/x86/kernel/cpu/mce/core.o: warning: objtool: mce_timed_out()+0x24: unreachable instruction
> kernel/exit.o: warning: objtool: __x64_sys_exit_group()+0x14: unreachable instruction
> 
> Full randconfig file is attached.

More livepatch...

-- 
Josh

