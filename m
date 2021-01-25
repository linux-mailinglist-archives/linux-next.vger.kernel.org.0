Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 795163021F4
	for <lists+linux-next@lfdr.de>; Mon, 25 Jan 2021 06:56:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbhAYFzI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Jan 2021 00:55:08 -0500
Received: from mail-1.ca.inter.net ([208.85.220.69]:44648 "EHLO
        mail-1.ca.inter.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727062AbhAYFyx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Jan 2021 00:54:53 -0500
Received: from localhost (offload-3.ca.inter.net [208.85.220.70])
        by mail-1.ca.inter.net (Postfix) with ESMTP id 9AD752EA02B;
        Mon, 25 Jan 2021 00:54:00 -0500 (EST)
Received: from mail-1.ca.inter.net ([208.85.220.69])
        by localhost (offload-3.ca.inter.net [208.85.220.70]) (amavisd-new, port 10024)
        with ESMTP id OOyMIAvLmBhD; Mon, 25 Jan 2021 00:39:59 -0500 (EST)
Received: from [192.168.48.23] (host-104-157-204-209.dyn.295.ca [104.157.204.209])
        (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dgilbert@interlog.com)
        by mail-1.ca.inter.net (Postfix) with ESMTPSA id E0B542EA012;
        Mon, 25 Jan 2021 00:53:59 -0500 (EST)
Reply-To: dgilbert@interlog.com
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210125151310.20e71400@canb.auug.org.au>
From:   Douglas Gilbert <dgilbert@interlog.com>
Message-ID: <17ccd90b-8616-1f20-ad5d-e250834c02fe@interlog.com>
Date:   Mon, 25 Jan 2021 00:53:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210125151310.20e71400@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2021-01-24 11:13 p.m., Stephen Rothwell wrote:
> Hi all,
> 
> After merging the scsi-mkp tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/scsi/sg.c: In function 'sg_find_srp_by_id':
> drivers/scsi/sg.c:2908:4: error: expected '}' before 'else'
>   2908 |    else
>        |    ^~~~
> drivers/scsi/sg.c:2902:16: warning: unused variable 'cptp' [-Wunused-variable]
>   2902 |    const char *cptp = "pack_id=";
>        |                ^~~~
> drivers/scsi/sg.c:2896:5: error: label 'good' used but not defined
>   2896 |     goto good;
>        |     ^~~~
> drivers/scsi/sg.c: At top level:
> drivers/scsi/sg.c:2913:2: error: expected identifier or '(' before 'return'
>   2913 |  return NULL;
>        |  ^~~~~~
> drivers/scsi/sg.c:2914:5: error: expected '=', ',', ';', 'asm' or '__attribute__' before ':' token
>   2914 | good:
>        |     ^
> drivers/scsi/sg.c:2917:2: error: expected identifier or '(' before 'return'
>   2917 |  return srp;
>        |  ^~~~~~
> drivers/scsi/sg.c:2918:1: error: expected identifier or '(' before '}' token
>   2918 | }
>        | ^
> drivers/scsi/sg.c: In function 'sg_find_srp_by_id':
> drivers/scsi/sg.c:2912:2: error: control reaches end of non-void function [-Werror=return-type]
>   2912 |  }
>        |  ^
> 
> Caused by commit
> 
>    7323ad3618b6 ("scsi: sg: Replace rq array with xarray")
> 
> SG_LOG() degenerates to "{}" in some configs ...
> 
> I have used the scsi-mkp tree from next-20210122 for today.
> 

Hi,
I sent a new patchset to the linux-scsi list about 4 hours ago to
fix that.

Doug Gilbert

