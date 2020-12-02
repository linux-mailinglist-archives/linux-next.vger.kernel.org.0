Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACBDB2CBCDD
	for <lists+linux-next@lfdr.de>; Wed,  2 Dec 2020 13:24:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729881AbgLBMWo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Dec 2020 07:22:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35943 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729855AbgLBMWm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Dec 2020 07:22:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606911675;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=F7u4vMj3ouC+FQN5tXZq6LGEkO4TiuyXwQTPhBCOFZI=;
        b=Jk2vVRdUzDWJeoDmChgPKbLi5DIYrCrmgDcH9FwPkSLFhYxJcWkDAOTwWvWFGobf4SXWP5
        7bXrUqBCBmYk1u7xagsKalr0i+D1RzTpqgBNOnHZyjEK4YlslnOPxerryUTI/b2PW2fXuB
        OMLucxX9lu95KLdYSodVsrDnRmfrXkE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-II_ouiB1PjOONG0BEiDQYw-1; Wed, 02 Dec 2020 07:21:14 -0500
X-MC-Unique: II_ouiB1PjOONG0BEiDQYw-1
Received: by mail-ej1-f72.google.com with SMTP id dc13so2976250ejb.9
        for <linux-next@vger.kernel.org>; Wed, 02 Dec 2020 04:21:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=F7u4vMj3ouC+FQN5tXZq6LGEkO4TiuyXwQTPhBCOFZI=;
        b=gWaCHYzeeOd57nDWOgM0ESA/+MONUEsazFUrTnlaZVgAySvn3/emd2FH98lR/h4Ox9
         EMmV9D3nBIsB9yOhJpDCU2uUCHvz1rKr5rhXLDKubO3bI2szw6rMXUtaj24zUN07DhUH
         qIKoJ/O5L5CBsJCY8HVpKRcNjCTBKf6bvroNj7RTgsAG6XqmVMSRzvEhkB7XOip3ue2B
         z5UXLLT/iM3RiAw70xrNtglAzsS/N8e8L9hvJaKVEkj38PA65NkYMNCWcp7QrgyLyLnr
         vIm/yQ5HeUBDIt93Tn8S3gaHaVTc7ternpz6I3eQa4Pp3KZ1XZunBdaHWclyxk2aR9WM
         Rc3w==
X-Gm-Message-State: AOAM530nr8ASrhop1gWSfEV6sk2D46dv0JKJrFqmrUnQ4aYnujCMHyeM
        5v7gQdMtLrwT0ibH0q+r7WxcpRg5ghJTByS3tGoc/Nrb3a65iX0HC/PQ65GPqEXIAREUoVRkxXb
        lzWlz6XcgkeXZgEcbGczi2Q==
X-Received: by 2002:a17:906:a186:: with SMTP id s6mr2017641ejy.193.1606911672834;
        Wed, 02 Dec 2020 04:21:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxB4/5iEEMITnaT5+f8dbWBw/936RDdwkELroxEQgaQPw1PYFhmh5DNqzRQTs4qeFIQao8YbA==
X-Received: by 2002:a17:906:a186:: with SMTP id s6mr2017625ejy.193.1606911672679;
        Wed, 02 Dec 2020 04:21:12 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id n22sm1080944edr.11.2020.12.02.04.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Dec 2020 04:21:12 -0800 (PST)
Subject: Re: [PATCH] platform/x86: dell-wmi-sysman: work around for BIOS bug
To:     Divya Bharathi <divya27392@gmail.com>, dvhart@infradead.org
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Divya Bharathi <divya.bharathi@dell.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Prasanth KSR <prasanth.ksr@dell.com>
References: <20201202065636.299000-1-divya.bharathi@dell.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <06db27af-7387-9343-acd3-d75e8c46b623@redhat.com>
Date:   Wed, 2 Dec 2020 13:21:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201202065636.299000-1-divya.bharathi@dell.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 12/2/20 7:56 AM, Divya Bharathi wrote:
> BIOS sets incorrect value (zero) when SET value passed for integer attribute
> with + sign. Added workaround to remove + sign before passing input to BIOS
> 
> Co-developed-by: Mario Limonciello <mario.limonciello@dell.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> Co-developed-by: Prasanth KSR <prasanth.ksr@dell.com>
> Signed-off-by: Prasanth KSR <prasanth.ksr@dell.com>
> Signed-off-by: Divya Bharathi <divya.bharathi@dell.com>
> ---
>  drivers/platform/x86/dell-wmi-sysman/int-attributes.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell-wmi-sysman/int-attributes.c b/drivers/platform/x86/dell-wmi-sysman/int-attributes.c
> index ea773d8e8d3a..f30d155135c3 100644
> --- a/drivers/platform/x86/dell-wmi-sysman/int-attributes.c
> +++ b/drivers/platform/x86/dell-wmi-sysman/int-attributes.c
> @@ -39,7 +39,7 @@ static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *a
>   * @instance_id: The instance on which input is validated
>   * @buf: Input value
>   */
> -static int validate_integer_input(int instance_id, const char *buf)
> +static int validate_integer_input(int instance_id, char *buf)
>  {
>  	int in_val;
>  	int ret;
> @@ -51,6 +51,12 @@ static int validate_integer_input(int instance_id, const char *buf)
>  			in_val > wmi_priv.integer_data[instance_id].max_value)
>  		return -EINVAL;
>  
> +	/* workaround for BIOS error.
> +	 * validate input to avoid setting 0 when integer input passed with + sign
> +	 */
> +	if (*buf == '+')
> +		memmove(buf, (buf + 1), strlen(buf));

Can you please use "strlen(buf + 1) + 1" as last argument to the memmove?

I know the effect is the same but that makes it much clearer that you
are also moving the terminating 0 (which at first I thought you were not).

Otherwise this looks good to me.

Regards,

Hans

