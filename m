Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C16A6138DC4
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2020 10:28:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725978AbgAMJ2X (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jan 2020 04:28:23 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:50514 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725832AbgAMJ2X (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Jan 2020 04:28:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578907701;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=R3C4Q941xE3AXEWBJErO7jF+8a/J+pt1q7fx5URkZDQ=;
        b=LRdnajscsIfSpImUc19xZUeW8wHngGPjE1tD6inPbJcEi6RXDwB3tMnR2WX7aiVsz/Kdj/
        QkWwMxwweInNC/Ta14YEF1aPwF2/KNPQUZM0MRWIy5B27aUqjWJGVdbe8XNWruNL4DjmII
        XbNsPg54n8SrBPtGtvWhubODypYqf3I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-w0d3Mc0IMw2EZcjYE1xdYA-1; Mon, 13 Jan 2020 04:28:19 -0500
X-MC-Unique: w0d3Mc0IMw2EZcjYE1xdYA-1
Received: by mail-wm1-f69.google.com with SMTP id y125so2416154wmg.1
        for <linux-next@vger.kernel.org>; Mon, 13 Jan 2020 01:28:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=R3C4Q941xE3AXEWBJErO7jF+8a/J+pt1q7fx5URkZDQ=;
        b=Meyd7vvuUn9UX5ySnqcaZP9q7GQ0f7MCZkoZClAVBfJ5kJFlSk7zpjToSXBrgClYXa
         lLJ1S3twfVeNW6PF4ZH0YbuVqMvd87Tx63xgNSexOeY5ui3UupyxVhjdb9jDsVPBVfWY
         z3zORB3QsNOFl+a6LBu14pE4APj07qtr7IlFH8v8VtG6Pt8Dq/jWcJj8zMvb357spzg7
         XS7KcMLp7tXbIHIKp2/wp7jV5mz9ecT4WebNe+ZGbAirwhYT9v1YGpneQhi62KPB+Z7V
         4I+VgGBfx0QVqmdhsHqoR9vVyV7wD/Ig43zOeRms8F/yDyragyaiP7DE8pTpXZbPIM+P
         KjPA==
X-Gm-Message-State: APjAAAVFA0hx7ToQEqMErKgoLF0/ZHmlzbk4s9UtnZx+ui2xQx7rFZ/e
        Ce46AzxeTrwU+ID1UeaHkJETiXSoVjjEZus9HBPLDLHCWg3HW3y4sjMM2pL2XlyEbucd8XO1ho3
        6wFTDNmsr7In94N/NbTQ6LQ==
X-Received: by 2002:a5d:49c7:: with SMTP id t7mr16792089wrs.369.1578907698501;
        Mon, 13 Jan 2020 01:28:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqwssFIroUIb1buW5MykkVVj/TQlDVXxwPmj/97+2mYHumLWKoldzBD8ViDURwXYkubqia4XUw==
X-Received: by 2002:a5d:49c7:: with SMTP id t7mr16792071wrs.369.1578907698283;
        Mon, 13 Jan 2020 01:28:18 -0800 (PST)
Received: from orion (ip-89-103-126-188.net.upcbroadband.cz. [89.103.126.188])
        by smtp.gmail.com with ESMTPSA id m7sm13200881wma.39.2020.01.13.01.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 01:28:17 -0800 (PST)
Date:   Mon, 13 Jan 2020 10:28:15 +0100
From:   Carlos Maiolino <cmaiolino@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs tree
Message-ID: <20200113092815.qwndd7oi5wglxh3c@orion>
Mail-Followup-To: Carlos Maiolino <cmaiolino@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200110175729.3b5d2338@canb.auug.org.au>
 <20200110110353.klnooeqv4b6ipxid@orion>
 <20200111094427.4c875a90@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200111094427.4c875a90@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, Jan 11, 2020 at 09:44:27AM +1100, Stephen Rothwell wrote:
> Hi Carlos,
> 
> On Fri, 10 Jan 2020 12:03:53 +0100 Carlos Maiolino <cmaiolino@redhat.com> wrote:
> >
> > Eitherway, I am not 100% sure this is the right fix for this case, I remember
> > some bmap() users who didn't need CONFIG_BLOCK, so we may still need to export
> > it without CONFIG_BLOCK.
> > Can you please send me your configuration?
> 
> It was a x86_64 allnoconfig build.

Thanks for the info Stephen.

I think the correct way to fix this though, is to wrap the whole bmap(){}
definition in a #ifdef block, not only the EXPORT symbol, as, by my patches, we
redefine bmap() as an inline symbol if CONFIG_BLOCK is not set. So, something
like this:


diff --git a/fs/inode.c b/fs/inode.c
index 9f894b25af2b..21e58542801b 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1612,6 +1612,8 @@ EXPORT_SYMBOL(iput);
  *	Returns -EINVAL in case of error, 0 otherwise. If mapping falls into a
  *	hole, returns 0 and *block is also set to 0.
  */
+
+#ifdef CONFIG_BLOCK
 int bmap(struct inode *inode, sector_t *block)
 {
 	if (!inode->i_mapping->a_ops->bmap)
@@ -1621,6 +1623,7 @@ int bmap(struct inode *inode, sector_t *block)
 	return 0;
 }
 EXPORT_SYMBOL(bmap);
+#endif
 
 /*
  * With relative atime, only update atime if the previous atime is

So, we preserve the original inline definition in include/fs.h (making bmap()
just returning -EINVAL). What do you think?

Viro, mind to share your opinion? I can send a 'Fixes:' patch.

Cheers



-- 
Carlos

