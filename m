Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97F7C9CDB5
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2019 13:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730497AbfHZLFV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Aug 2019 07:05:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35350 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727138AbfHZLFV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Aug 2019 07:05:21 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 3C6363082E55;
        Mon, 26 Aug 2019 11:05:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DB465D704;
        Mon, 26 Aug 2019 11:05:21 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
        by colo-mx.corp.redhat.com (Postfix) with ESMTP id 170284A460;
        Mon, 26 Aug 2019 11:05:21 +0000 (UTC)
Date:   Mon, 26 Aug 2019 07:05:20 -0400 (EDT)
From:   Jan Stancek <jstancek@redhat.com>
To:     Cyril Hrubis <chrubis@suse.cz>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     ltp@lists.linux.it,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        alexey kodanev <alexey.kodanev@oracle.com>,
        the hoang0709 <the_hoang0709@yahoo.com>
Message-ID: <1264279239.8133737.1566817520787.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190826104127.GA14729@haruka>
References: <CA+G9fYtN2tjHZtjtc8isdsD5hF76teeh2-pngUp+uj3WYdj7jA@mail.gmail.com> <20190826104127.GA14729@haruka>
Subject: Re: Linux-next-20190823: x86_64/i386: prot_hsymlinks.c:325: Failed
 to run cmd: useradd hsym
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.40.205.130, 10.4.195.19]
Thread-Topic: Linux-next-20190823: x86_64/i386: prot_hsymlinks.c:325: Failed to run cmd: useradd hsym
Thread-Index: RPWG8U5fZVqaDFrtv/g7lFBKoEVaLw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Mon, 26 Aug 2019 11:05:21 +0000 (UTC)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



----- Original Message -----
> Hi!
> > Do you see this LTP prot_hsymlinks failure on linux next 20190823 on
> > x86_64 and i386 devices?
> > 
> > test output log,
> > useradd: failure while writing changes to /etc/passwd
> > useradd: /home/hsym was created, but could not be removed
> 
> This looks like an unrelated problem, failure to write to /etc/passwd
> probably means that filesystem is full or some problem happend and how
> is remounted RO.

In Naresh' example, root is on NFS:
  root=/dev/nfs rw nfsroot=10.66.16.123:/var/lib/lava/dispatcher/tmp/886412/extract-nfsrootfs-tyuevoxm,tcp,hard,intr

10.66.16.123:/var/lib/lava/dispatcher/tmp/886412/extract-nfsrootfs-tyuevoxm on / type nfs (rw,relatime,vers=2,rsize=4096,wsize=4096,namlen=255,hard,nolock,proto=tcp,timeo=600,retrans=2,sec=sys,mountaddr=10.66.16.123,mountvers=1,mountproto=tcp,local_lock=all,addr=10.66.16.123)
devtmpfs on /dev type devtmpfs (rw,relatime,size=3977640k,nr_inodes=994410,mode=755)

Following message repeats couple times in logs:
  NFS: Server wrote zero bytes, expected XXX

Naresh, can you check if there are any errors on NFS server side?
Maybe run NFS cthon against that server with client running next-20190822 and next-20190823.

> 
> I do not see the kernel messages from this job anywhere at the job
> pages, is it stored somewhere?

It appears to be mixed in same log file:
  https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20190823/testrun/886412/log
