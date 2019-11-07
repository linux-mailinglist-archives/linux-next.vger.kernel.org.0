Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D85A2F33C7
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2019 16:51:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbfKGPvO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Nov 2019 10:51:14 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35486 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbfKGPvN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 Nov 2019 10:51:13 -0500
Received: by mail-pl1-f194.google.com with SMTP id s10so1765958plp.2;
        Thu, 07 Nov 2019 07:51:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wCIUACXkFSlcAMRHFvS4hf99aXjQQqm2k7x2iKzum6Y=;
        b=sQsJJP1IpNS6KPaBICnwPb2IN3ZG61vtfzY0w6UDKF/WiwUE/XGzLBbfH3DFROvMnw
         424RnT5G3CiuZbO6fAR8T6fgRGbKBqDEa8/VzzCO0Kw+5b8rmRdVYve45Hd3/n0Q6dQZ
         eO08SahznF1xNTUTnD2gHGm/PK6aCrdkjfpHETofobqxEkHRgRkpYjpxQ3PxZeTCKJFD
         6NdcFokToxCirxYSU9FMT+3Jjp8PWw8v8NXqtkaDlLltG18kBok+EVnMzS7Q6aeRNFNd
         sT7yKFb22jLZyhQ0JrPGlO0DKq9I/TAEPyZdszW6bYonQu1ZprfIZFkmEpuiu4s5Gcr2
         4pbA==
X-Gm-Message-State: APjAAAVhmp3F1iyQ65V2fuGccWMUiQ2ua5k5TVZ1y7sjaXHqk6Rw1PkH
        wBTwp/J4042pJHHO6M32Tlc=
X-Google-Smtp-Source: APXvYqw/q4umZFByQNDGLZ8+bRj+n23NNSNuRPxtTrQot1bJ78guoSBCKLcXYKEPv5ffr4D/JPfVhg==
X-Received: by 2002:a17:902:bf0c:: with SMTP id bi12mr4165243plb.98.1573141872848;
        Thu, 07 Nov 2019 07:51:12 -0800 (PST)
Received: from desktop-bart.svl.corp.google.com ([2620:15c:2cd:202:4308:52a3:24b6:2c60])
        by smtp.gmail.com with ESMTPSA id t1sm3125408pgp.9.2019.11.07.07.51.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2019 07:51:12 -0800 (PST)
Subject: Re: linux-next: build warning after merge of the scsi tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        James Smart <jsmart2021@gmail.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Dick Kennedy <dick.kennedy@broadcom.com>
References: <20191107145523.1792cafb@canb.auug.org.au>
From:   Bart Van Assche <bvanassche@acm.org>
Message-ID: <3a7be3f6-7aea-3660-bf20-dd2563d479bf@acm.org>
Date:   Thu, 7 Nov 2019 07:51:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191107145523.1792cafb@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/6/19 8:01 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the scsi tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> drivers/scsi/lpfc/lpfc_init.c: In function 'lpfc_cpumask_of_node_init':
> drivers/scsi/lpfc/lpfc_init.c:6020:6: warning: the address of 'cpu_all_bits' will always evaluate as 'true' [-Waddress]
>   6020 |  if (!cpumask_of_node(numa_node))
>        |      ^
> 
> Introduced by commit
> 
>    dcaa21367938 ("scsi: lpfc: Change default IRQ model on AMD architectures")

Thanks Stephen for this report. A candidate fix has been posted: 
https://lore.kernel.org/linux-scsi/20191107052158.25788-6-bvanassche@acm.org/T/#u

Bart.


