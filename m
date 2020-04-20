Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A12E91B10BF
	for <lists+linux-next@lfdr.de>; Mon, 20 Apr 2020 17:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729062AbgDTPxk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Apr 2020 11:53:40 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:20128 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728948AbgDTPxk (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Apr 2020 11:53:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587398019;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=RiIH4zglO3RPAXeHMoIlaUTnxrbObtFWcUuFZVIVitc=;
        b=HnKzPHbiVmk52+Tlqo97aC95EEB3yeL15BVtsm1Pgi2mjg6SiffrTV82C29Iw3JwzNe9/C
        GABhrBNuUC1FSUPyz+31N69BosK7pPZHtuSWVaiuGeyMKO1mYZBcyjQvifUEeW/P1fyhVi
        eCR7tsZpR9BgCf9TRCKu/DLFHmCBljo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-8hLN_HPPOQ281RkBFtXdsA-1; Mon, 20 Apr 2020 11:53:35 -0400
X-MC-Unique: 8hLN_HPPOQ281RkBFtXdsA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 151EE107ACC9;
        Mon, 20 Apr 2020 15:53:34 +0000 (UTC)
Received: from treble (ovpn-116-8.rdu2.redhat.com [10.10.116.8])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AF0B5C1B2;
        Mon, 20 Apr 2020 15:53:32 +0000 (UTC)
Date:   Mon, 20 Apr 2020 10:53:30 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Apr 20 (objtool warning)
Message-ID: <20200420155330.5uepjeyfsso5l4rm@treble>
References: <20200420142610.390e5922@canb.auug.org.au>
 <30d5a881-95fe-9f98-a899-2c955c5eb2c1@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <30d5a881-95fe-9f98-a899-2c955c5eb2c1@infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Apr 20, 2020 at 08:29:04AM -0700, Randy Dunlap wrote:
> On 4/19/20 9:26 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20200417:
> > 
> 
> on x86_64:
> 
> arch/x86/kvm/svm/vmenter.o: warning: objtool: __svm_vcpu_run()+0xe4: BP used as a scratch register
> 
> Full randconfig file is included.

Yeah, frame pointers are toast in that function.  We'll need something
like:

diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
index a789759b7261..221e2bd7e76d 100644
--- a/arch/x86/kvm/Makefile
+++ b/arch/x86/kvm/Makefile
@@ -3,6 +3,10 @@
 ccflags-y += -Iarch/x86/kvm
 ccflags-$(CONFIG_KVM_WERROR) += -Werror
 
+ifeq ($(CONFIG_UNWINDER_FRAME_POINTER),y)
+OBJECT_FILES_NON_STANDARD_vmenter.o := y
+endif
+
 KVM := ../../../virt/kvm
 
 kvm-y			+= $(KVM)/kvm_main.o $(KVM)/coalesced_mmio.o \


