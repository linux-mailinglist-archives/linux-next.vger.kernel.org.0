Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC30A154ABB
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2020 19:04:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727685AbgBFSEP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 Feb 2020 13:04:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:24922 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727662AbgBFSEP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 Feb 2020 13:04:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581012254;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Y/oUdILRq0LVH4thGA+cmxynW/DGFzJVkoOfhzWfStg=;
        b=QFsT8ZwPgvJwEvaj+X4ASiHtizZClCmFmpY42YlhGu7XjlOAgvW11mPhAHU3k+Jm4cjB6T
        Qse3kAhF9pDJuP+wBgsjNgzIYU3fDGyzb38IRrHa9JwCmtXgb/UJKDrRojxmVd9Wy/T/DV
        o5q9iuLB6oE+8xrQyicubBssdEbJM98=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-iZJLLlR7N7SfU8lSIS-k8g-1; Thu, 06 Feb 2020 13:04:11 -0500
X-MC-Unique: iZJLLlR7N7SfU8lSIS-k8g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD7021800D42;
        Thu,  6 Feb 2020 18:04:10 +0000 (UTC)
Received: from treble (ovpn-120-83.rdu2.redhat.com [10.10.120.83])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id D1F851001B05;
        Thu,  6 Feb 2020 18:04:09 +0000 (UTC)
Date:   Thu, 6 Feb 2020 12:04:07 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Feb 6 (objtool warning)
Message-ID: <20200206180407.vr5dyg2h73hmceh3@treble>
References: <20200206150901.6f9f792e@canb.auug.org.au>
 <8a8a76cd-81d6-ffeb-08d8-e8de427caa45@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8a8a76cd-81d6-ffeb-08d8-e8de427caa45@infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Feb 06, 2020 at 08:10:20AM -0800, Randy Dunlap wrote:
> On 2/5/20 8:09 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Please do not add any v5.7 material to your linux-next included
> > branches until after v5.6-rc1 has been released.
> > 
> > Changes since 20200205:
> > 
> 
> drivers/pinctrl/pinctrl-ingenic.o: warning: objtool: ingenic_pinconf_set() falls through to next function ingenic_pinconf_group_set()

Thanks Randy.  I'm able to recreate with the config.  Objtool is
confused by the unreachable() statement in ingenic_pinconf_set().

I think a BUG() would be more appropriate anyway.  Will post a proper
patch.

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 96f04d121ebd..6b61ac6cd4d2 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -2158,7 +2158,7 @@ static int ingenic_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			break;
 
 		default:
-			unreachable();
+			BUG();
 		}
 	}
 

