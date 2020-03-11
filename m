Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69613181C02
	for <lists+linux-next@lfdr.de>; Wed, 11 Mar 2020 16:04:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729811AbgCKPEp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Mar 2020 11:04:45 -0400
Received: from foss.arm.com ([217.140.110.172]:50816 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729100AbgCKPEp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Mar 2020 11:04:45 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D937731B;
        Wed, 11 Mar 2020 08:04:44 -0700 (PDT)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A53C23F67D;
        Wed, 11 Mar 2020 08:04:39 -0700 (PDT)
Subject: Re: arm64 system corruption on linux-next?
To:     John Garry <john.garry@huawei.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
References: <8c018ee5-de2a-d948-fcae-feaf1303e160@huawei.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <38086674-4d19-e828-cc75-0e7775ccdc23@arm.com>
Date:   Wed, 11 Mar 2020 15:04:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8c018ee5-de2a-d948-fcae-feaf1303e160@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi John,

On 10/03/2020 6:38 pm, John Garry wrote:
> Hi all,
> 
> On my arm64 Huawei D06 dev board, I see this on sometimes on linux-next 
> 20200310 just as the boot completes:
> 
> [   48.452674] pcieport 0000:b4:01.0: Adding to iommu group 40
> [   48.473426] rtc-efi rtc-efi.0: setting system clock to 
> 2020-03-10T18:31:29 UTC (1583865089)
> [   48.473426] rtc-efi rtc-efi.0: setting system clock to 
> 2020-03-10T18:31:29 UTC (1583865089)
> [   48.486755] hid-generic 0003:12D1:0003.0001: input: USB HID v1.10 
> Keyboard [Keyboard/Mouse KVM 1.1.0] on usb-0000:7a:01.0-1.1/input0
> [   48.486755] hid-generic 0003:12D1:0003.0001: input: USB HID v1.10 
> Keyboard [Keyboard/Mouse KVM 1.1.0] on usb-0000:7a:01.0-1.1/input0
> [   48.491033] ALSA device list:
> [   48A device list:
> [   48.522304]   No soundcards found.
> [   48.522304]   No soundcards found.
> [   48.526319] input: Keyboard/Mouse KVM 1.1.0 as 
> /devices/pci0000:7a/0000:7a:01.0/usb1/1-1/1-1.1/1-1.1:1.1/0003:12D1:0003.0002/input/input2 
> 
> [   48.526319] input: Keyboard/Mouse KVM 1.1.0 as 
> /devices/pci0000:7a/0000:7a:01.0/usb1/1-1/1-1.1/1-1.1:1.1/0003:12D1:0003.0002/input/input2 
> 
> [|Uz
> ���p X4n0Jj ЬH,p~wv�^;�~Tt�k�v��"��±�
>                                        �rZ�,� � ��Hk��
>                                                        v7�C (���� չ�E^�- z
>                                                                           �
> ±�  � ��� �\ ���p X4n0Jj p�H,p~wv�^;+~Tt�k�v� "�
> w�b���P�k�h�P��.�p���N�P P�X��9� 0� �k�h�P�i.�p���N��&�����.¬�jP�V�v 
> t�Y��*�v���� �F9�
> 
> 
> The system is still alive, as keypresses respond with garbage.

FWIW, that looks every bit like something changing the UART baud rate 
under the console's feet, either explicitly, or implicitly by messing 
with the input clock behind the driver's back.

Robin.

> 
> Full dmesg:
> https://pastebin.com/C2Xy0yUW
> 
> 
> v5.6-rc4 is ok from my attempts.
> 
> Anyone else see such an issue?
> 
> Thanks,
> John
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
