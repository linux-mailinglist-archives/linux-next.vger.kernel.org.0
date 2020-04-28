Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57B931BB75D
	for <lists+linux-next@lfdr.de>; Tue, 28 Apr 2020 09:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726337AbgD1HVM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Apr 2020 03:21:12 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37212 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726256AbgD1HVM (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Apr 2020 03:21:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588058471;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/den9zmKGrpVFBXzjlPglB/ChNlVKR2OXRC/pLbk40k=;
        b=EdR/bryb8FCmR7vxDN03r1mfYAidwDX/98A5dVVM1EtVPssd0CrcIuQV4sfUyPejIhPP2W
        idQN8Fcm+Syoi5WNgCei+hC8SWGFOXsYVaYyWg0w/b40tNCLUCy2ZGgI86vmDjwxIFXkIy
        svUyw9PXhGi6uq4zgPbuZRCEjVQJvRk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-z_oQ0rSwMoi1XlXv-ppzwA-1; Tue, 28 Apr 2020 03:21:09 -0400
X-MC-Unique: z_oQ0rSwMoi1XlXv-ppzwA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A98071895A28;
        Tue, 28 Apr 2020 07:21:07 +0000 (UTC)
Received: from treble (ovpn-112-209.rdu2.redhat.com [10.10.112.209])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id B8883605DD;
        Tue, 28 Apr 2020 07:21:06 +0000 (UTC)
Date:   Tue, 28 Apr 2020 02:20:59 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] x86/unwind/orc: Move ORC sorting variables under
 CONFIG_MODULE
Message-ID: <20200428072059.t7cwyiykc23wdvje@treble>
References: <20200428162910.0dee6f52@canb.auug.org.au>
 <20200428071640.psn5m7eh3zt2in4v@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200428071640.psn5m7eh3zt2in4v@treble>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Apr 28, 2020 at 02:16:43AM -0500, Josh Poimboeuf wrote:
> Fix the following warnings seen with !CONFIG_MODULE:

s/MODULE/MODULES/ here and $SUBJECT.

-- 
Josh

