Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70FC1276BBF
	for <lists+linux-next@lfdr.de>; Thu, 24 Sep 2020 10:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727183AbgIXIZd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Sep 2020 04:25:33 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47454 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726837AbgIXIZd (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 24 Sep 2020 04:25:33 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08O83jdK046375;
        Thu, 24 Sep 2020 04:25:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Ifch1AEfNsKK2bI+U+ETwakiXL+Ndk0qT/3Mta2JI8Y=;
 b=EXMpKBPlOW53HgP/N8x9cla3qaDC/ZkJZW+ioATcrTjeEQk/DYbvciOeYV5hWs6X4AxG
 Xdn6A/gWIF/GaPxQjV3qiqSTbvWm7oI7KcK5z1blCWpcnESBqMMcWRYeI+a4oAoLEpfx
 F/VdeC0SfxWQ2m5imMfxdBb3bC6392m0GFjZbMY7mBbr25WeWGjPlB3PzmOvMzI6fDfR
 8KhI50oMD6VLfmlnW0lTGCtvNkHKSMP4S5vxu+I2uhC/SP/i46+8Ei9SPC8AJzOVju85
 9pS/JN46ab2fhYVJIbAJqRaoeIUHQyVjvRxc4vECw1DFBq8PXm0PDLzsDWdgFv4ghAAg OQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 33rqm7rpgv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 24 Sep 2020 04:25:26 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08O83qjA047431;
        Thu, 24 Sep 2020 04:25:25 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
        by mx0a-001b2d01.pphosted.com with ESMTP id 33rqm7rpg3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 24 Sep 2020 04:25:25 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
        by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08O8HUe1025798;
        Thu, 24 Sep 2020 08:25:23 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
        by ppma01fra.de.ibm.com with ESMTP id 33n9m7tks8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 24 Sep 2020 08:25:23 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 08O8PHdf22282518
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 24 Sep 2020 08:25:17 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 117AD11C05B;
        Thu, 24 Sep 2020 08:25:17 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 95D2211C052;
        Thu, 24 Sep 2020 08:25:16 +0000 (GMT)
Received: from [9.145.35.177] (unknown [9.145.35.177])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Thu, 24 Sep 2020 08:25:16 +0000 (GMT)
Subject: Re: linux-next: manual merge of the vfio tree with the s390 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Williamson <alex.williamson@redhat.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>
Cc:     Matthew Rosato <mjrosato@linux.ibm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200924142651.28382ed7@canb.auug.org.au>
From:   Niklas Schnelle <schnelle@linux.ibm.com>
Message-ID: <b9f4f5d2-ea40-aa58-3c4d-bebfa828ce72@linux.ibm.com>
Date:   Thu, 24 Sep 2020 10:25:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200924142651.28382ed7@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-24_02:2020-09-24,2020-09-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1011 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009240062
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

first thanks for the manual fix it's exactly the same resolution I would
have used. Sorry this conflict ended up on your desk without warning,
I had made Vasily and Heiko aware of this as an upcoming conflict but failed
to alert Alex who finally ended up carrying the change so I this is my fault.

Best regards,
Niklas Schnelle

On 9/24/20 6:26 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the vfio tree got a conflict in:
> 
>   arch/s390/pci/pci_bus.c
> 
> between commit:
> 
>   abb95b7550f8 ("s390/pci: consolidate SR-IOV specific code")
> 
> from the s390 tree and commit:
> 
>   08b6e22b850c ("s390/pci: Mark all VFs as not implementing PCI_COMMAND_MEMORY")
> 
> from the vfio tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
