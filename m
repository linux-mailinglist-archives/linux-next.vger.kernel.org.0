Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 630C19EF86
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2019 17:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbfH0P7P (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 27 Aug 2019 11:59:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33986 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726257AbfH0P7P (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 27 Aug 2019 11:59:15 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 448D73082B41;
        Tue, 27 Aug 2019 15:59:15 +0000 (UTC)
Received: from treble (ovpn-121-55.rdu2.redhat.com [10.10.121.55])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 933245C1D6;
        Tue, 27 Aug 2019 15:59:13 +0000 (UTC)
Date:   Tue, 27 Aug 2019 10:59:11 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Aug 27 (objtool)
Message-ID: <20190827155911.ct2zzo2zhcrauf3z@treble>
References: <20190827190526.6f27e763@canb.auug.org.au>
 <6c42e32f-901d-be78-e69b-cb9ff8703932@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6c42e32f-901d-be78-e69b-cb9ff8703932@infradead.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Tue, 27 Aug 2019 15:59:15 +0000 (UTC)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 27, 2019 at 08:40:07AM -0700, Randy Dunlap wrote:
> On 8/27/19 2:05 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20190826:
> > 
> 
> on x86_64:
> 
> arch/x86/kvm/vmx/vmx.o: warning: objtool: vmx_handle_exit_irqoff()+0x33: unreachable instruction
> 
> > gcc --version
> gcc (SUSE Linux) 7.4.0
> 
> 
> want more info?

Yes, can you provide the .o and the .config?

-- 
Josh
