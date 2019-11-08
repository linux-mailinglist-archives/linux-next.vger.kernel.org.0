Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27C5CF5B92
	for <lists+linux-next@lfdr.de>; Sat,  9 Nov 2019 00:03:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbfKHXDC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Nov 2019 18:03:02 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35966 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfKHXDC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 Nov 2019 18:03:02 -0500
Received: by mail-wr1-f68.google.com with SMTP id r10so8814792wrx.3;
        Fri, 08 Nov 2019 15:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=udaxrt3XnrWEC9M1Y9RVfizXLl29vH9+UyOxjM3wuzc=;
        b=BJukUM87b/u/A3eKR2Lfv8KYlBkhbGzaaUHrPzcwFMUEdNodA+fWjoqNNlHBb41inA
         R/P5O93U0XRtphBDVSQOql65HwtoPCx8LYW41QokMedAaclecUmmXAB/ETV1D9kbOBN6
         iHYma5Nit0POQz/0VV9XP/NdVGVemlDQd3UZFbXeSqEtF7vByCYTJyoN02NwcuAq79sz
         m9R8wVOUHVD0YtcYmemgZXQepiffKcfsNJNYHRyQtSGs/pBAesI1LwJcqtYupv6sBRSr
         36RCIffAsB3SFI/2wsDOLHtjsrYoU7IhVv+6gc+MwBZ4cc50wMnYyXRSa/6GLKj0BAYL
         38vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=udaxrt3XnrWEC9M1Y9RVfizXLl29vH9+UyOxjM3wuzc=;
        b=l+TexfV9amPWKNM+13OMDyQg1jpsUuylLLKAlljAtyJOXTYbi92vS9YN3iYCmeZ4z0
         FeCtiQfPw6dJ9Mgu8giyxJ6oYNxUg001noYXqU/XL8mrICy2FMhiNXKXqRRPy+/8WD0s
         Nlj3rcLswb0lW0gBhbi4wMYPEwxmt9bdrx6CX2t6+03wjRUG+rYIAskBaGugGr0rtNlY
         TtU0U2dBgYW+lka9MhlNqwCgbg6I78aOaNib1YMmH1YYqi6/qokxtFVNfhvafey7sVsb
         mDBq9NI660LxbdBE6zOlNlyZ9KlQy+hc5V5yNL/DS1N6okmwh5HrhOOagdokgPdqvyU2
         CEjw==
X-Gm-Message-State: APjAAAUQpaqSPYwnTraPpAOgKa657K3rZfq2+BCeoGcgq7iZKbBZpgzl
        O99PChnjwdF5qFYY6gM97PEs4ITs
X-Google-Smtp-Source: APXvYqxiwZihi9yJa5OiKRp9+13b0HEM1W0hETCo+JyiFjFHFu1CHQu8lZRc/C2/0Ml7H5piFXRPow==
X-Received: by 2002:adf:e74b:: with SMTP id c11mr11250549wrn.357.1573254180677;
        Fri, 08 Nov 2019 15:03:00 -0800 (PST)
Received: from [10.230.29.90] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id t133sm12339914wmb.1.2019.11.08.15.02.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Nov 2019 15:03:00 -0800 (PST)
Subject: Re: linux-next: build warning after merge of the scsi tree
To:     Bart Van Assche <bvanassche@acm.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Dick Kennedy <dick.kennedy@broadcom.com>,
        James Smart <james.smart@broadcom.com>
References: <20191107145523.1792cafb@canb.auug.org.au>
 <3a7be3f6-7aea-3660-bf20-dd2563d479bf@acm.org>
From:   James Smart <jsmart2021@gmail.com>
Message-ID: <43644d42-3dfe-1c8c-fe6d-a017bc06087e@gmail.com>
Date:   Fri, 8 Nov 2019 15:02:56 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3a7be3f6-7aea-3660-bf20-dd2563d479bf@acm.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/7/2019 7:51 AM, Bart Van Assche wrote:
> On 11/6/19 8:01 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the scsi tree, today's linux-next build (powerpc
>> ppc64_defconfig) produced this warning:
>>
>> drivers/scsi/lpfc/lpfc_init.c: In function 'lpfc_cpumask_of_node_init':
>> drivers/scsi/lpfc/lpfc_init.c:6020:6: warning: the address of 
>> 'cpu_all_bits' will always evaluate as 'true' [-Waddress]
>>   6020 |  if (!cpumask_of_node(numa_node))
>>        |      ^
>>
>> Introduced by commit
>>
>>    dcaa21367938 ("scsi: lpfc: Change default IRQ model on AMD 
>> architectures")
> 
> Thanks Stephen for this report. A candidate fix has been posted: 
> https://lore.kernel.org/linux-scsi/20191107052158.25788-6-bvanassche@acm.org/T/#u 
> 
> 
> Bart.
> 
> 

See revised fix at:
https://marc.info/?l=linux-scsi&m=157325403920775&w=2

-- james
