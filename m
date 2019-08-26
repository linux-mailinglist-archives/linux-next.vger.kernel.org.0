Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E93569D9C9
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2019 01:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbfHZXMy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Aug 2019 19:12:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49726 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726307AbfHZXMy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Aug 2019 19:12:54 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 91C31C00A166;
        Mon, 26 Aug 2019 23:12:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 7050E196AE;
        Mon, 26 Aug 2019 23:12:53 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
        by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1C15C18005A0;
        Mon, 26 Aug 2019 23:12:52 +0000 (UTC)
Date:   Mon, 26 Aug 2019 19:12:52 -0400 (EDT)
From:   Jan Stancek <jstancek@redhat.com>
To:     Trond Myklebust <trondmy@hammerspace.com>
Cc:     naresh kamboju <naresh.kamboju@linaro.org>,
        the hoang0709 <the_hoang0709@yahoo.com>,
        linux-next@vger.kernel.org, ltp@lists.linux.it,
        linux-kernel@vger.kernel.org, chrubis@suse.cz,
        alexey kodanev <alexey.kodanev@oracle.com>
Message-ID: <2039173876.8300255.1566861172742.JavaMail.zimbra@redhat.com>
In-Reply-To: <fcd20866bb836d45b1e384dd68080c671bcde938.camel@hammerspace.com>
References: <CA+G9fYtN2tjHZtjtc8isdsD5hF76teeh2-pngUp+uj3WYdj7jA@mail.gmail.com> <20190826104127.GA14729@haruka> <1264279239.8133737.1566817520787.JavaMail.zimbra@redhat.com> <CA+G9fYsHpNKFHr=ZukVvj+uMJDyHj2Xwb9bCfzPQyYzMjZ0rCw@mail.gmail.com> <203971593.8175020.1566830285708.JavaMail.zimbra@redhat.com> <fcd20866bb836d45b1e384dd68080c671bcde938.camel@hammerspace.com>
Subject: Re: Linux-next-20190823: x86_64/i386: prot_hsymlinks.c:325: Failed
 to run cmd: useradd hsym
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.40.205.130, 10.4.195.29]
Thread-Topic: Linux-next-20190823: x86_64/i386: prot_hsymlinks.c:325: Failed
 to run cmd: useradd hsym
Thread-Index: YFeV1UC3LeIsRdovt5+kMdO7I/BycvuMo5UAj4lK/k0=
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Mon, 26 Aug 2019 23:12:53 +0000 (UTC)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


----- Original Message -----
> On Mon, 2019-08-26 at 10:38 -0400, Jan Stancek wrote:
> > ----- Original Message -----
> > > Hi Jan and Cyril,
> > > 
> > > On Mon, 26 Aug 2019 at 16:35, Jan Stancek <jstancek@redhat.com>
> > > wrote:
> > > > 
> > > > 
> > > > ----- Original Message -----
> > > > > Hi!
> > > > > > Do you see this LTP prot_hsymlinks failure on linux next
> > > > > > 20190823 on
> > > > > > x86_64 and i386 devices?
> > > > > > 
> > > > > > test output log,
> > > > > > useradd: failure while writing changes to /etc/passwd
> > > > > > useradd: /home/hsym was created, but could not be removed
> > > > > 
> > > > > This looks like an unrelated problem, failure to write to
> > > > > /etc/passwd
> > > > > probably means that filesystem is full or some problem happend
> > > > > and how
> > > > > is remounted RO.
> > > > 
> > > > In Naresh' example, root is on NFS:
> > > >   root=/dev/nfs rw
> > > >  
> > > > nfsroot=10.66.16.123:/var/lib/lava/dispatcher/tmp/886412/extract-
> > > > nfsrootfs-tyuevoxm,tcp,hard,intr
> > > 
> > > Right !
> > > root is mounted on NFS.
> > > 
> > > > 10.66.16.123:/var/lib/lava/dispatcher/tmp/886412/extract-
> > > > nfsrootfs-tyuevoxm
> > > > on / type nfs
> > > > (rw,relatime,vers=2,rsize=4096,wsize=4096,namlen=255,hard,nolock,
> > > > proto=tcp,timeo=600,retrans=2,sec=sys,mountaddr=10.66.16.123,moun
> > > > tvers=1,mountproto=tcp,local_lock=all,addr=10.66.16.123)
> > > > devtmpfs on /dev type devtmpfs
> > > > (rw,relatime,size=3977640k,nr_inodes=994410,mode=755)
> > > > 
> 
> The only thing I can think of that might cause an EIO on NFSv2 would be
> this patch
> http://git.linux-nfs.org/?p=trondmy/linux-nfs.git;a=commitdiff;h=627d48e597ec5993c4abb3b81dc75e554a07c7c0
> assuming that a bind-related error is leaking through.
> 
> I'd suggest something like the following to fix it up:

No change with that patch,
but following one fixes it for me:

diff --git a/fs/nfs/pagelist.c b/fs/nfs/pagelist.c
index 20b3717cd7ca..56cefa0ab804 100644
--- a/fs/nfs/pagelist.c
+++ b/fs/nfs/pagelist.c
@@ -590,7 +590,7 @@ static void nfs_pgio_rpcsetup(struct nfs_pgio_header *hdr,
        }
 
        hdr->res.fattr   = &hdr->fattr;
-       hdr->res.count   = 0;
+       hdr->res.count   = count;
        hdr->res.eof     = 0;
        hdr->res.verf    = &hdr->verf;
        nfs_fattr_init(&hdr->fattr);

which is functionally revert of "NFS: Fix initialisation of I/O result struct in nfs_pgio_rpcsetup".

This hunk caught my eye, could res.eof == 0 explain those I/O errors?
                /* Emulate the eof flag, which isn't normally needed in NFSv2                                                                                 
                 * as it is guaranteed to always return the file attributes                                                                                   
                 */                                                                                                                                           
                if (hdr->args.offset + hdr->res.count >= hdr->res.fattr->size)                                                                                
                        hdr->res.eof = 1; 
