Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E22484570BD
	for <lists+linux-next@lfdr.de>; Fri, 19 Nov 2021 15:35:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235928AbhKSOiU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 19 Nov 2021 09:38:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28488 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235970AbhKSOiQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 19 Nov 2021 09:38:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637332514;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mm/1sr0bdKvIDzeoCiebWBOdcipYTxhxLdJgjjMHe5k=;
        b=bRR5lwVazm+Wv29R30tfU7a9gfoDZvgcbdFwDll1VLfqwFDEBaVdsADMqc3H85x4DXaKK7
        VYJpsLxwABbuioRwamMQA9nWPFpOM0jBFKrNMFV7TwOnOMIkP2hnebZZ8CQmeTjqtfcUoe
        nNxJvtHDDCweB+Z+SWtqN0LeqcDoyVc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-vhrJCnNvNMO_JpWyF3fLUw-1; Fri, 19 Nov 2021 09:35:13 -0500
X-MC-Unique: vhrJCnNvNMO_JpWyF3fLUw-1
Received: by mail-ed1-f70.google.com with SMTP id v22-20020a50a456000000b003e7cbfe3dfeso8541057edb.11
        for <linux-next@vger.kernel.org>; Fri, 19 Nov 2021 06:35:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mm/1sr0bdKvIDzeoCiebWBOdcipYTxhxLdJgjjMHe5k=;
        b=zCZ4rLjL2NoSPEsWd708eRffbcnHa+popJE49b0wo4ITGdmhBVYryhu7UkRwNMcbjs
         4AKzo+l69nczHKwc8+11nli7HVVu/xqi50OWl3koeUf34Kgzmja8Lnom7ShLayW9tr8/
         7vTnPjL/DujvaW/GSWWyIbYvVYQutNLcdeQhQZIZdgf9GnV0XVNMjhsK+xObMYNQGgLJ
         epNYHEluyI87bZ0gBe+BUdEjViwTSBUTHhy+GsAL5MVs/u0n7fQ/2ynV+KIu5kQFOKgj
         abOgM0v6FuskHMudRFZ1JG5AxspVFCfMGb6EvPA3aB5DRDgdP61SBWMPqU1GyV3TIGt5
         3LOA==
X-Gm-Message-State: AOAM531ScTBxRj0oAjiVkdUo1gj3dVHAbon6o5yE7d+bLyFuJulFrI/8
        d1lLGrazu4MqExNBIjNgfTvU0VEcDcMjLFT+z+Kf9hFx96ELXqoe+lKII6iNgau4ulkiuMZe5Gb
        xl5cJY8sTGYvQ513dcVwdkw==
X-Received: by 2002:a50:99c6:: with SMTP id n6mr24060027edb.171.1637332511822;
        Fri, 19 Nov 2021 06:35:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzj0Mme0k2YDoI7RMSrOdEJplOkKjDKmkbta34QlWBd7ALtl44GQCW8oR56pMnuu3cngOECUA==
X-Received: by 2002:a50:99c6:: with SMTP id n6mr24059999edb.171.1637332511663;
        Fri, 19 Nov 2021 06:35:11 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id y17sm1749368edd.31.2021.11.19.06.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Nov 2021 06:35:11 -0800 (PST)
Message-ID: <99cafdbc-e4fa-9fc5-2dea-1a071919338e@redhat.com>
Date:   Fri, 19 Nov 2021 15:35:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: mmotm 2021-11-18-15-47 uploaded (<linux/proc_fs.h>)
Content-Language: en-US
To:     Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     broonie@kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-next@vger.kernel.org, mhocko@suse.cz,
        mm-commits@vger.kernel.org, sfr@canb.auug.org.au
References: <20211118234743.-bgoWMQfK%akpm@linux-foundation.org>
 <db0b9313-fef6-2977-9b1c-4c830edea5c5@infradead.org>
 <20211118170426.bfcd00c159aba815ffc282d3@linux-foundation.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211118170426.bfcd00c159aba815ffc282d3@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 11/19/21 02:04, Andrew Morton wrote:
> On Thu, 18 Nov 2021 16:53:30 -0800 Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>> On 11/18/21 3:47 PM, akpm@linux-foundation.org wrote:
>>> The mm-of-the-moment snapshot 2021-11-18-15-47 has been uploaded to
>>>
>>>     https://www.ozlabs.org/~akpm/mmotm/
>>>
>>> mmotm-readme.txt says
>>>
>>> README for mm-of-the-moment:
>>>
>>> https://www.ozlabs.org/~akpm/mmotm/
>>>
>>> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
>>> more than once a week.
>>>
>>> You will need quilt to apply these patches to the latest Linus release (5.x
>>> or 5.x-rcY).  The series file is in broken-out.tar.gz and is duplicated in
>>> https://ozlabs.org/~akpm/mmotm/series
>>>
>>> The file broken-out.tar.gz contains two datestamp files: .DATE and
>>> .DATE-yyyy-mm-dd-hh-mm-ss.  Both contain the string yyyy-mm-dd-hh-mm-ss,
>>> followed by the base kernel version against which this patch series is to
>>> be applied.
>>
>> Hi,
>>
>> I get hundreds of warnings from <linux/proc_fs.h>:
>>
>> from proc-make-the-proc_create-stubs-static-inlines.patch:
>>
>> ../include/linux/proc_fs.h:186:2: error: parameter name omitted
>> ../include/linux/proc_fs.h:186:32: error: parameter name omitted
>> ../include/linux/proc_fs.h:186:63: error: parameter name omitted
> 
> Nobody uses PROC_FS=n ;)

Weird I thought I did a deliberate test compile with PROC_FS=n to test this
(but without W=1 ...).

Andrew, thank you for fixing this.

Regards,

Hans


> 
> --- a/include/linux/proc_fs.h~proc-make-the-proc_create-stubs-static-inlines-fix
> +++ a/include/linux/proc_fs.h
> @@ -179,12 +179,14 @@ static inline struct proc_dir_entry *pro
>  #define proc_create_single(name, mode, parent, show) ({NULL;})
>  #define proc_create_single_data(name, mode, parent, show, data) ({NULL;})
>  
> -static inline struct proc_dir_entry *proc_create(
> -	const char *, umode_t, struct proc_dir_entry *, const struct proc_ops *)
> +static inline struct proc_dir_entry *
> +proc_create(const char *name, umode_t mode, struct proc_dir_entry *parent,
> +	    const struct proc_ops *proc_ops)
>  { return NULL; }
>  
> -static inline struct proc_dir_entry *proc_create_data(
> -	const char *, umode_t, struct proc_dir_entry *, const struct proc_ops *, void *)
> +static inline struct proc_dir_entry *
> +proc_create_data(const char *name, umode_t mode, struct proc_dir_entry *parent,
> +		 const struct proc_ops *proc_ops, void *data)
>  { return NULL; }
>  
>  static inline void proc_set_size(struct proc_dir_entry *de, loff_t size) {}
> _
> 

