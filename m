Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA6415E43C
	for <lists+linux-next@lfdr.de>; Fri, 14 Feb 2020 17:35:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393621AbgBNQew (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 14 Feb 2020 11:34:52 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:40611 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387897AbgBNQew (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 14 Feb 2020 11:34:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581698091;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=66gI72zIdGrYip3e/zissi+i6Lpg2Px8EGOqdpuzt18=;
        b=N31IxzwPKValBcjmW+4cyCd6i5Rs8xW2HJBc7bWyR4BqJG5dM5g8mRgkK+feqCSBV7+l7l
        NmxVa7qTHY97RqmXHoWhgUtpKLnJXZBujvBAaJXeG/myxqsGDT78oGfp1gn0L6J+M7FUNA
        BOdDpC/3sNK0OU9S8Q8f6ag8C/wuROc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-PqJ2zFrANmGJDwa9ZsUUyg-1; Fri, 14 Feb 2020 11:34:47 -0500
X-MC-Unique: PqJ2zFrANmGJDwa9ZsUUyg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21898107ACC4;
        Fri, 14 Feb 2020 16:34:46 +0000 (UTC)
Received: from treble (ovpn-121-12.rdu2.redhat.com [10.10.121.12])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id BBC8D60BEF;
        Fri, 14 Feb 2020 16:34:44 +0000 (UTC)
Date:   Fri, 14 Feb 2020 10:34:42 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Feb 14 (objtool warning)
Message-ID: <20200214163442.egm5h24hepe2p43f@treble>
References: <20200214131146.342474af@canb.auug.org.au>
 <106727c6-db3c-c400-f387-f9f90117cd9d@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <106727c6-db3c-c400-f387-f9f90117cd9d@infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Feb 14, 2020 at 08:20:05AM -0800, Randy Dunlap wrote:
> On 2/13/20 6:11 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20200213:
> > 
> 
> on x86_64:
> 
> drivers/pinctrl/pinctrl-ingenic.o: warning: objtool: ingenic_pinconf_set()+0xc6: sibling call from callable instruction with modified stack frame
> 
> 
> Full randconfig file is attached.

Thanks.  This is similar to the one from the other day (though with a
different warning).  I'll post the patch shortly.

-- 
Josh

