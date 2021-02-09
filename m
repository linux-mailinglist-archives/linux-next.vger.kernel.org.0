Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4064315A0A
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 00:31:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233852AbhBIX35 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Feb 2021 18:29:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43035 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234699AbhBIXCb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Feb 2021 18:02:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612911607;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=SA6kakV1SOYYbDyoyq9jrgTtNWutLHHtwS4+AwSyzGU=;
        b=jLzkWY+B6uaqhNYLsD+IWAIwowxNPm/wPKm3pX2xQoyIBOwz0z3eosa7Bgo/NExR3vIlZ6
        cAjxkEqOfwfG4/YLGa75LDED5KPUWzi4YCTlouYxaKZ9a+mUyxs3iXn7KAHo51GxCsSKrr
        7+R54UT8+y2ZmT1UgQnql5ns5Y5QHuo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-0TmmCEr3MIGW_LddZcYDrA-1; Tue, 09 Feb 2021 18:00:03 -0500
X-MC-Unique: 0TmmCEr3MIGW_LddZcYDrA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38BFB18829C1;
        Tue,  9 Feb 2021 23:00:02 +0000 (UTC)
Received: from treble (ovpn-120-169.rdu2.redhat.com [10.10.120.169])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BF225D9CD;
        Tue,  9 Feb 2021 23:00:01 +0000 (UTC)
Date:   Tue, 9 Feb 2021 16:59:59 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Feb 8 (objtool: warnings: 5)
Message-ID: <20210209225959.vobnut7nsneiujyl@treble>
References: <20210208235246.01cb4daf@canb.auug.org.au>
 <2000eae0-89f4-a88f-a113-7fa47f16def7@infradead.org>
 <20210208212153.vs2v7k2c55a3syvo@treble>
 <9fd03d53-8001-b76f-feea-179c13633a8b@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9fd03d53-8001-b76f-feea-179c13633a8b@infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Feb 08, 2021 at 01:39:03PM -0800, Randy Dunlap wrote:
> On 2/8/21 1:21 PM, Josh Poimboeuf wrote:
> > On Mon, Feb 08, 2021 at 11:30:59AM -0800, Randy Dunlap wrote:
> >> On 2/8/21 4:52 AM, Stephen Rothwell wrote:
> >>> Hi all,
> >>>
> >>> Changes since 20210205:
> >>>
> >>
> >> on x86_64:
> >>
> >> objtool warnings: (from 3 different randconfig builds)
> >>
> >> drivers/input/touchscreen/elants_i2c.o: warning: objtool: elants_i2c_initialize() falls through to next function elants_i2c_resume()
> > 
> > Randy, can you share the .o?  (you may need to gzip it, still waiting on
> > corporate IT to allow me to receive .o files)
> 
> Sure, no problem. It's attached.

Does this fix?

From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: [PATCH] input/elants_i2c: Detect enum overflow

If an enum value were to get added without updating this switch
statement, the unreachable() annotation would trigger undefined
behavior, causing execution to fall through the end of the function,
into the next one.

Make the error handling more robust for an unexpected enum value, by
doing BUG() instead of unreachable().

Fixes the following objtool warning:

  drivers/input/touchscreen/elants_i2c.o: warning: objtool: elants_i2c_initialize() falls through to next function elants_i2c_resume()

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
---
 drivers/input/touchscreen/elants_i2c.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 6f57ec579f00..4c2b579f6c8b 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -656,8 +656,7 @@ static int elants_i2c_initialize(struct elants_data *ts)
 			error = elants_i2c_query_ts_info_ektf(ts);
 		break;
 	default:
-		unreachable();
-		break;
+		BUG();
 	}
 
 	if (error)
-- 
2.29.2

