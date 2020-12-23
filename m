Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC0C2E1849
	for <lists+linux-next@lfdr.de>; Wed, 23 Dec 2020 06:11:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbgLWFLg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Dec 2020 00:11:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52374 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726642AbgLWFLg (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Dec 2020 00:11:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1608700210;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=uDakDtaKGN81kRZuViNJrTsdCZOB1YP0/byRJLdBn0s=;
        b=DlaoxtH6nDyx9XPG9/XFrBJceO8undQGydOnAHS+j4qNqyOqxMdWCu1jFvJiTGKBKYhlkF
        8yAweR0WZWjGsOfOmJF2FS1uhNKwc+s5L1ou52vrv/j4JrApLCf+c5ZbTQnawtsTFP0Zfk
        OTI2DnOdOjr+zwQFWj8iey41obvgsuI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-3WhaSoriMqqONoE06fNivQ-1; Wed, 23 Dec 2020 00:10:05 -0500
X-MC-Unique: 3WhaSoriMqqONoE06fNivQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D2E9180A092;
        Wed, 23 Dec 2020 05:10:04 +0000 (UTC)
Received: from treble (ovpn-117-91.rdu2.redhat.com [10.10.117.91])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A4745D743;
        Wed, 23 Dec 2020 05:10:01 +0000 (UTC)
Date:   Tue, 22 Dec 2020 23:09:58 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Dec 21 (objtool warning)
Message-ID: <20201223050958.z2nkn6h3l3lyeckg@treble>
References: <20201221141811.33dedcbe@canb.auug.org.au>
 <161c578e-c8c2-a730-a772-5d69909f5b7c@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <161c578e-c8c2-a730-a772-5d69909f5b7c@infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Dec 21, 2020 at 08:03:17AM -0800, Randy Dunlap wrote:
> On 12/20/20 7:18 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > News: there will be no linux-next releases between Dec 24 and Jan
> > 3 inclusive.
> > 
> > Please do not add any v5.12 destined code to your linux-next included
> > branches until after v5.11-rc1 has been released.
> > 
> > Changes since 20201218:
> > 
> 
> on x86_64:
> 
> arch/x86/kernel/sys_ia32.o: warning: objtool: cp_stat64()+0xd8: call to new_encode_dev() with UACCESS enabled

Can you send a .o for this one?  Please gzip it because my email has
been rejecting .o files lately :-/

-- 
Josh

