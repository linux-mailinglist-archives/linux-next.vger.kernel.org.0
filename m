Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8430728FDC9
	for <lists+linux-next@lfdr.de>; Fri, 16 Oct 2020 07:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390708AbgJPFoe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Oct 2020 01:44:34 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38328 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388836AbgJPFod (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 16 Oct 2020 01:44:33 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09G5VmKD118584;
        Fri, 16 Oct 2020 01:44:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : references : date : in-reply-to : message-id : mime-version :
 content-type; s=pp1; bh=vGnGKcU4E7DFgr62TsRxPZJdQvwxqE7vmufXuceXSX0=;
 b=KLn2/x9Ff852xiZl05nmDBtYc6oPdBJVbIxF4wWngKpnIxpkgUfVODAXZASaA6iUUi+o
 trDEGusvS/nkTtuFUJRoz3yfQkzimZDEIzRVLwnK6Hdu4xuJmgA7FlwYhq24xKnuyvvT
 M9dWTWzm1wTbRwY3pAInaY37rGhV5l4xmnA5ksrOO+ltvpgNUguQ9q2VU2ndd0YnzFTf
 gpOXtB84YwvxkxfvHx7qCx/5ReuyPQnsqMg+tYOyobx9/bwY5E7XxK5VtXx3uTeFcOt+
 vuGeZXOkQbd9ZZia1WztoEN+hIAuXFzV2qR5aZLwlePDxm0Jg9PzKr0F7vHdGmqvZtie EA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3475038x0d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Oct 2020 01:44:19 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
        by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09G5fxJW002683;
        Fri, 16 Oct 2020 05:44:17 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma04ams.nl.ibm.com with ESMTP id 3434k7wx26-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Oct 2020 05:44:17 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 09G5iFgm33489184
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 16 Oct 2020 05:44:15 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9479FA405B;
        Fri, 16 Oct 2020 05:44:15 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 47A53A405C;
        Fri, 16 Oct 2020 05:44:15 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.152.85.9])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Fri, 16 Oct 2020 05:44:15 +0000 (GMT)
From:   Sven Schnelle <svens@linux.ibm.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        linux-kernel@vger.kernel.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>
Subject: Re: autofs crash with latest linux-next
References: <yt9d1ri3nakg.fsf@linux.ibm.com>
        <8a4c7324-4637-7f25-82b6-2fd30aacb73e@de.ibm.com>
        <20201014071547.GA2459@kozik-lap> <202010151226.7382E03@keescook>
Date:   Fri, 16 Oct 2020 07:44:14 +0200
In-Reply-To: <202010151226.7382E03@keescook> (Kees Cook's message of "Thu, 15
        Oct 2020 12:28:14 -0700")
Message-ID: <yt9dblh2sp1t.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-16_01:2020-10-16,2020-10-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 mlxscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1031
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010160034
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Kees Cook <keescook@chromium.org> writes:

> On Wed, Oct 14, 2020 at 09:15:47AM +0200, Krzysztof Kozlowski wrote:
>> I hit this since few days as well. Although the bisect points to the
>> merge, the issue looks like a result of mentioned commit 4d03e3cc5982
>> ("fs: don't allow kernel reads and writes without iter ops").
>> 
>> The __kernel_read() last argument 'pos' can be NULL and it is
>> dereferenced here (added by the commit):
>> 
>>  525 ssize_t __kernel_write(struct file *file, const void *buf, size_t count, loff_t *pos)
>> ...
>>  547         kiocb.ki_pos = *pos;
>>  548         iov_iter_kvec(&iter, WRITE, &iov, 1, iov.iov_len);
>> 
>> 
>> The __kernel_read() is called with NULL in fs/autofs/waitq.c:
>> 
>>  45 static int autofs_write(struct autofs_sb_info *sbi,
>>  46                         struct file *file, const void *addr, int bytes)
>> 
>> ...
>>  54         mutex_lock(&sbi->pipe_mutex);
>>  55         while (bytes) {
>>  56                 wr = __kernel_write(file, data, bytes, NULL);
>
> I think the thread here is the same thing, but you've found it in
> autofs...
> https://lore.kernel.org/lkml/CAHk-=wgj=mKeN-EfV5tKwJNeHPLG0dybq+R5ZyGuc4WeUnqcmA@mail.gmail.com/

Indeed. Thanks, missed that.

Sven
