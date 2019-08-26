Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3F649D10F
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2019 15:51:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728597AbfHZNvP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Aug 2019 09:51:15 -0400
Received: from mail-lj1-f176.google.com ([209.85.208.176]:41182 "EHLO
        mail-lj1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728749AbfHZNvO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 26 Aug 2019 09:51:14 -0400
Received: by mail-lj1-f176.google.com with SMTP id m24so15118279ljg.8
        for <linux-next@vger.kernel.org>; Mon, 26 Aug 2019 06:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8H72TrYC5gZvMPhRumnBYIWBJ5xS8zMVHqHb8s+Sb3o=;
        b=Dn4xaVrTDityhgDmAXP5mahh8jhaq+TI8TXcev4ytU9RMTXCbnfaNmqYWkr/ZM1N3G
         Dmn0ReLawj12cfsKUCvSAKiy+jV58Ah/khvkXPKmAwYJ8eFGbp/uAL3/Pyt0AOLEoBit
         gYk6Uno5KfxtnY9+NXurS1w20hKq3j1OgLspIc6Z8qROdW9UNRk/oMRavNc8jrkjl3mx
         uVjnh1nJjYeJybcif8BsxjSjzCEuwv7+QF3Hz7MocC1xHDzuoMrnESTHoVCGlsT8wHMm
         Ocjqs7g4Buu5frPRBqa8B5IcB/Twam2qrOd+lAWRx0IWDhbKWggsNWDR+hf2gVLjAAlX
         Q/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8H72TrYC5gZvMPhRumnBYIWBJ5xS8zMVHqHb8s+Sb3o=;
        b=EdtUMWN6ihygv/F/FzBBnTcV/QoTeV2hCFwHMIpe+98GuQkX/gBGwwGs+3O6conJfA
         YD7yE7OtRI8LDAUA/hJGciRPwH2QQ4ttjCPckxrNFWBydWbyV549xgLdU+rwoiZ23qaq
         aoqmikQSlT5j90ysGegNnZMMidG0oXjes14Zpp1Xxgv9TuXZu4IwgT6rlQ7BXyW51qlO
         PfROo26Xqp2pBoNwlQ72BFOPxg8bCYfEkzuwGkK9RbT9TQxxAIUI9bu9w+E7NNf/uiul
         DgpyJEa8GC8HyapIClHtV9mPH/PGdB4S38sMomyAkYbfLrSL53jjlnrAHZT/cNj/qAaP
         qb9w==
X-Gm-Message-State: APjAAAX0rDVnz/8r1Qag9fZe5LkaoGAyh6p9rPNMJk082T8dK6VKek25
        n/cSg5Xj6DzC67NePdtn0q9N8+KZC/8KqQYKbT3YxA==
X-Google-Smtp-Source: APXvYqxfoDUXiZvyj8ZD8yhHri4inkNQ1AyC2xCtZuHCXJahSPiD+yMmzxFbp0qFrMVuZ6SHpjt+O8ffbyiazKLxWuY=
X-Received: by 2002:a2e:a0c3:: with SMTP id f3mr10776519ljm.123.1566827471744;
 Mon, 26 Aug 2019 06:51:11 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYtN2tjHZtjtc8isdsD5hF76teeh2-pngUp+uj3WYdj7jA@mail.gmail.com>
 <20190826104127.GA14729@haruka> <1264279239.8133737.1566817520787.JavaMail.zimbra@redhat.com>
In-Reply-To: <1264279239.8133737.1566817520787.JavaMail.zimbra@redhat.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 26 Aug 2019 19:20:59 +0530
Message-ID: <CA+G9fYsHpNKFHr=ZukVvj+uMJDyHj2Xwb9bCfzPQyYzMjZ0rCw@mail.gmail.com>
Subject: Re: Linux-next-20190823: x86_64/i386: prot_hsymlinks.c:325: Failed to
 run cmd: useradd hsym
To:     Jan Stancek <jstancek@redhat.com>
Cc:     Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        alexey kodanev <alexey.kodanev@oracle.com>,
        the hoang0709 <the_hoang0709@yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Jan and Cyril,

On Mon, 26 Aug 2019 at 16:35, Jan Stancek <jstancek@redhat.com> wrote:
>
>
>
> ----- Original Message -----
> > Hi!
> > > Do you see this LTP prot_hsymlinks failure on linux next 20190823 on
> > > x86_64 and i386 devices?
> > >
> > > test output log,
> > > useradd: failure while writing changes to /etc/passwd
> > > useradd: /home/hsym was created, but could not be removed
> >
> > This looks like an unrelated problem, failure to write to /etc/passwd
> > probably means that filesystem is full or some problem happend and how
> > is remounted RO.
>
> In Naresh' example, root is on NFS:
>   root=3D/dev/nfs rw nfsroot=3D10.66.16.123:/var/lib/lava/dispatcher/tmp/=
886412/extract-nfsrootfs-tyuevoxm,tcp,hard,intr

Right !
root is mounted on NFS.

>
> 10.66.16.123:/var/lib/lava/dispatcher/tmp/886412/extract-nfsrootfs-tyuevo=
xm on / type nfs (rw,relatime,vers=3D2,rsize=3D4096,wsize=3D4096,namlen=3D2=
55,hard,nolock,proto=3Dtcp,timeo=3D600,retrans=3D2,sec=3Dsys,mountaddr=3D10=
.66.16.123,mountvers=3D1,mountproto=3Dtcp,local_lock=3Dall,addr=3D10.66.16.=
123)
> devtmpfs on /dev type devtmpfs (rw,relatime,size=3D3977640k,nr_inodes=3D9=
94410,mode=3D755)
>
> Following message repeats couple times in logs:
>   NFS: Server wrote zero bytes, expected XXX
>
> Naresh, can you check if there are any errors on NFS server side?

I have re-tested the failed tests on next-20190822 and all get pass
which is also
using same NFS server [1] [2].

> Maybe run NFS cthon against that server with client running next-20190822=
 and next-20190823.

Thanks for the pointers.
I will setup and run NFS cthon on next-20190822 and next-20190823.

>
> >
> > I do not see the kernel messages from this job anywhere at the job
> > pages, is it stored somewhere?
>
> It appears to be mixed in same log file:
>   https://qa-reports.linaro.org/lkft/linux-next-oe/build/next-20190823/te=
strun/886412/log

For the record the following tests failed on linux -next-20190823 on x86_64
and i386. The filesystem is mounted on NFS and tests are using
locally mounted hard drive ( with -d /scratch ).

Juno-r2 device filesystem mounted on NFS and did not see these errors
and test getting pass on -next-20190823.

These failures are reproducible all time on next-20190823 kernel on x86_64
and i386 device with root mounted on NFS [3] [4] [5] [6].

I will git bisect to find out which is bad commit.

prot_hsymlinks: [3]
------------------
useradd: failure while writing changes to /etc/passwd
useradd: /home/hsym was created, but could not be removed
userdel: user 'hsym' does not exist
prot_hsymlinks    1  TBROK  :  prot_hsymlinks.c:325: Failed to run
cmd: useradd hsym
prot_hsymlinks    2  TBROK  :  prot_hsymlinks.c:325: Remaining cases broken
prot_hsymlinks    3  TBROK  :  prot_hsymlinks.c:325: Failed to run
cmd: userdel -r hsym
prot_hsymlinks    4  TBROK  :  tst_sig.c:234: unexpected signal
SIGIOT/SIGABRT(6) received (pid =3D 8324).

logrotate01: [4]
-------------
compressing log with: /bin/gzip
error: error creating temp state file /var/lib/logrotate.status.tmp:
Input/output error
logrotate01    1  TFAIL  :  ltpapicmd.c:154: Test #1: logrotate
command exited with 1 return code. Output:

sem_unlink_2-2: [5]
------------------
make[3]: Entering directory
'/opt/ltp/testcases/open_posix_testsuite/conformance/interfaces/sem_unlink'
cat: write error: Input/output error
conformance/interfaces/sem_unlink/sem_unlink_2-2: execution: FAILED

syslog{01 ...10} [6]
-------------------
cp: failed to close '/etc/syslog.conf.ltpback': Input/output error
syslog01    1  TBROK  :  ltpapicmd.c:188: failed to backup /etc/syslog.conf

cp: failed to close '/etc/syslog.conf.ltpback': Input/output error
syslog02    1  TBROK  :  ltpapicmd.c:188: failed to backup /etc/syslog.conf

...
cp: failed to close '/etc/syslog.conf.ltpback': Input/output error
syslog10    1  TBROK  :  ltpapicmd.c:188: failed to backup /etc/syslog.conf

ref:
PASS on 20190222:
[1] https://lkft.validation.linaro.org/scheduler/job/890446#L1232
[2] https://lkft.validation.linaro.org/scheduler/job/890454

FAILED on 20190823:
[3] https://lkft.validation.linaro.org/scheduler/job/890404#L1245
[4] https://lkft.validation.linaro.org/scheduler/job/886408#L2544
[5] https://lkft.validation.linaro.org/scheduler/job/886409#L3088
[6] https://lkft.validation.linaro.org/scheduler/job/890400#L1234

 - Naresh
