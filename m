Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEAFD15BBB2
	for <lists+linux-next@lfdr.de>; Thu, 13 Feb 2020 10:30:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729636AbgBMJaM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 13 Feb 2020 04:30:12 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:36512 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729662AbgBMJaM (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 13 Feb 2020 04:30:12 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01D9JbkV143754
        for <linux-next@vger.kernel.org>; Thu, 13 Feb 2020 04:30:11 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2y4j865yhw-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Thu, 13 Feb 2020 04:30:10 -0500
Received: from localhost
        by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <borntraeger@de.ibm.com>;
        Thu, 13 Feb 2020 09:30:08 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
        by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Thu, 13 Feb 2020 09:30:04 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 01D9T9lq50266442
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 13 Feb 2020 09:29:09 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E4A3AA4054;
        Thu, 13 Feb 2020 09:30:03 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9CE46A4062;
        Thu, 13 Feb 2020 09:30:03 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.152.224.71])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Thu, 13 Feb 2020 09:30:03 +0000 (GMT)
Subject: Re: vhost changes (batched) in linux-next after 12/13 trigger random
 crashes in KVM guests after reboot
To:     =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kvm list <kvm@vger.kernel.org>,
        Halil Pasic <pasic@linux.ibm.com>,
        Cornelia Huck <cohuck@redhat.com>
References: <20200107042401-mutt-send-email-mst@kernel.org>
 <c6795e53-d12c-0709-c2e9-e35d9af1f693@de.ibm.com>
 <20200107065434-mutt-send-email-mst@kernel.org>
 <fe6e7e90-3004-eb7a-9ed8-b53a7667959f@de.ibm.com>
 <20200120012724-mutt-send-email-mst@kernel.org>
 <2a63b15f-8cf5-5868-550c-42e2cfd92c60@de.ibm.com>
 <b6e32f58e5d85ac5cc3141e9155fb140ae5cd580.camel@redhat.com>
 <1ade56b5-083f-bb6f-d3e0-3ddcf78f4d26@de.ibm.com>
 <20200206171349-mutt-send-email-mst@kernel.org>
 <5c860fa1-cef5-b389-4ebf-99a62afa0fe8@de.ibm.com>
 <20200207025806-mutt-send-email-mst@kernel.org>
 <97c93d38-ef07-e321-d133-18483d54c0c0@de.ibm.com>
 <CAJaqyWfngzP4d01B6+Sqt8FXN6jX7kGegjx8ie4no_1Er3igQA@mail.gmail.com>
 <43a5dbaa-9129-e220-8483-45c60a82c945@de.ibm.com>
 <e299afca8e22044916abbf9fbbd0bff6b0ee9e13.camel@redhat.com>
 <4c3f70b7-723a-8b0f-ac49-babef1bcc180@de.ibm.com>
 <50a79c3491ac483583c97df2fac29e2c3248fdea.camel@redhat.com>
From:   Christian Borntraeger <borntraeger@de.ibm.com>
Autocrypt: addr=borntraeger@de.ibm.com; prefer-encrypt=mutual; keydata=
 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
 nS4h0HDFPrrp1C2EMVYIQrMokWvlFZbCpsdYbBI=
Date:   Thu, 13 Feb 2020 10:30:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <50a79c3491ac483583c97df2fac29e2c3248fdea.camel@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20021309-0008-0000-0000-000003527267
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20021309-0009-0000-0000-00004A731ADA
Message-Id: <8fbbfb49-99d1-7fee-e713-d6d5790fe866@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-13_01:2020-02-12,2020-02-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 impostorscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 suspectscore=2 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002130073
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 12.02.20 17:34, Eugenio Pérez wrote:
> On Tue, 2020-02-11 at 14:13 +0100, Christian Borntraeger wrote:
>>
>> On 11.02.20 14:04, Eugenio Pérez wrote:
>>> On Mon, 2020-02-10 at 12:01 +0100, Christian Borntraeger wrote:
>>>> On 10.02.20 10:47, Eugenio Perez Martin wrote:
>>>>> Hi Christian.
>>>>>
>>>>> I'm not able to reproduce the failure with eccb852f1fe6bede630e2e4f1a121a81e34354ab commit. Could you add more
>>>>> data?
>>>>> Your configuration (libvirt or qemu line), and host's dmesg output if any?
>>>>>
>>>>> Thanks!
>>>>
>>>> If it was not obvious, this is on s390x, a big endian system.
>>>>
>>>
>>> Hi Christian. Thank you very much for your fast responses.
>>>
>>> Could you try this patch on top of eccb852f1fe6bede630e2e4f1a121a81e34354ab?
>>
>> I still get 
>> [   43.665145] Guest moved used index from 0 to 289
>> after some reboots.
>>
>>
>>> Thanks!
>>>
>>> From 71d0f9108a18aa894cc0c0c1c7efbad39f465a27 Mon Sep 17 00:00:00 2001
>>> From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <
>>> eperezma@redhat.com>
>>> Date: Tue, 11 Feb 2020 13:19:10 +0100
>>> Subject: [PATCH] vhost: fix return value of vhost_get_vq_desc
>>>
>>> Before of the batch change, it was the chain's head. Need to keep that
>>> way or we will not be able to free a chain of descriptors.
>>>
>>> Fixes: eccb852f1fe6 ("vhost: batching fetches")
>>> ---
>>>  drivers/vhost/vhost.c | 3 +--
>>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
>>> index b5a51b1f2e79..fc422c3e5c08 100644
>>> --- a/drivers/vhost/vhost.c
>>> +++ b/drivers/vhost/vhost.c
>>> @@ -2409,12 +2409,11 @@ int vhost_get_vq_desc(struct vhost_virtqueue *vq,
>>>  			*out_num += ret;
>>>  		}
>>>  
>>> -		ret = desc->id;
>>> -
>>>  		if (!(desc->flags & VRING_DESC_F_NEXT))
>>>  			break;
>>>  	}
>>>  
>>> +	ret = vq->descs[vq->first_desc].id;
>>>  	vq->first_desc = i + 1;
>>>  
>>>  	return ret;
>>>
> 
> Sorry, still not able to reproduce the issue.
> 
> Could we try to disable all the vhost features?
> 
> Thanks!
> 
> diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
> index 661088ae6dc7..08f6d2ccb697 100644
> --- a/drivers/vhost/vhost.h
> +++ b/drivers/vhost/vhost.h
> @@ -250,11 +250,11 @@ int vhost_init_device_iotlb(struct vhost_dev *d, bool enabled);
>         } while (0)
>  
>  enum {
> -       VHOST_FEATURES = (1ULL << VIRTIO_F_NOTIFY_ON_EMPTY) |
> -                        (1ULL << VIRTIO_RING_F_INDIRECT_DESC) |
> -                        (1ULL << VIRTIO_RING_F_EVENT_IDX) |
> -                        (1ULL << VHOST_F_LOG_ALL) |
> -                        (1ULL << VIRTIO_F_ANY_LAYOUT) |
> +       VHOST_FEATURES = /* (1ULL << VIRTIO_F_NOTIFY_ON_EMPTY) | */
> +                        /* (1ULL << VIRTIO_RING_F_INDIRECT_DESC) | */
> +                        /* (1ULL << VIRTIO_RING_F_EVENT_IDX) | */
> +                        /* (1ULL << VHOST_F_LOG_ALL) | */
> +                        /* (1ULL << VIRTIO_F_ANY_LAYOUT) | */
>                          (1ULL << VIRTIO_F_VERSION_1)
>  };
> 


I still get  guest crashes with this on top of eccb852f1fe6. (The patch did not
apply, I had to manually comment out these things)

