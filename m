Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 077778DB86
	for <lists+linux-next@lfdr.de>; Wed, 14 Aug 2019 19:26:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728981AbfHNR0A convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Wed, 14 Aug 2019 13:26:00 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45619 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729398AbfHNRFP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Aug 2019 13:05:15 -0400
Received: by mail-pl1-f193.google.com with SMTP id y8so8848838plr.12;
        Wed, 14 Aug 2019 10:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GTqeZQuB5IgM+FmX9PwW5NoGtvVH2NCZhDAITGesyDI=;
        b=V4BknI/9PTqQybKoUCZBxz9U/b5ss9/oMzwfXviFWJQvjysp2n0UMUxS4FpgjCLXNC
         72470W68kb3LTbYUsJih/SDba9IqNn0ofADPWaJ966SEiVPgF78wx2OJfRwp/yIB2QQ5
         qzPM8Ofh149MJk+AuTxTGqfu/1gyYBBJc7zJb0mvK16xoWGgSRqq7nNe/UOopunAuGXl
         rwdSx6g1dloV4QulTqGLbsw4t9cwXL6aAAEOzRXGc4Dzp5Jw7PpShCS0vdUgdImPmFUH
         FlxekAu7Er1Z52PVHAq7HsTdPq6GvUwQM7+xYXZZHcHOEOxGztHVf/Vikv/VaPTmjgL8
         jHNA==
X-Gm-Message-State: APjAAAV3ciIb0fHybDZhn8ptyDFsaapNXBdwukteY4FH0ct5nMbcOUFV
        djIwVtzpMtm3jTQydCpQ3Klfc9WrCXo=
X-Google-Smtp-Source: APXvYqyY7dMRw94QInx53Q43ZHoQCxgqlpv6Xz4f7o17+uQhWoBsE2UtI2jpEFYNuEjRmoBdpNZKug==
X-Received: by 2002:a17:902:8345:: with SMTP id z5mr406730pln.29.1565802314643;
        Wed, 14 Aug 2019 10:05:14 -0700 (PDT)
Received: from ?IPv6:2620:15c:2c1:200:fb9c:664d:d2ad:c9b5? ([2620:15c:2c1:200:fb9c:664d:d2ad:c9b5])
        by smtp.gmail.com with ESMTPSA id c70sm359640pfb.163.2019.08.14.10.05.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2019 10:05:13 -0700 (PDT)
Subject: Re: [5.3.0-rc4-next][bisected 882632][qla2xxx] WARNING: CPU: 10 PID:
 425 at drivers/scsi/qla2xxx/qla_isr.c:2784 qla2x00_status_entry.isra
To:     Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc:     linux-next <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        martin.petersen@oracle.com, hmadhani@marvell.com,
        sachinp <sachinp@linux.vnet.ibm.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Himanshu Madhani <hmadhani@marvell.com>
References: <1565801523.6908.6.camel@abdul>
From:   Bart Van Assche <bvanassche@acm.org>
Message-ID: <cafb1d40-a11e-c137-db06-4564e5f5caf5@acm.org>
Date:   Wed, 14 Aug 2019 10:05:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565801523.6908.6.camel@abdul>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8BIT
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/14/19 9:52 AM, Abdul Haleem wrote:
> Greeting's
> 
> Today's linux-next kernel (5.3.0-rc4-next-20190813)  booted with warning on my powerpc power 8 lpar
> 
> The WARN_ON_ONCE() was introduced by commit 88263208 (scsi: qla2xxx: Complain if sp->done() is not...)
> 
> boot logs:
> 
> WARNING: CPU: 10 PID: 425 at drivers/scsi/qla2xxx/qla_isr.c:2784

Hi Abdul,

Thank you for having reported this. Is that the only warning reported on your setup by the qla2xxx
driver? If that warning is commented out, does the qla2xxx driver work as expected?

Thanks,

Bart.

