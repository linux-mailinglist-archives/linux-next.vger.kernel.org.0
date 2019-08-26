Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97A1C9CD21
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2019 12:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730423AbfHZKNf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Mon, 26 Aug 2019 06:13:35 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43666 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730482AbfHZKNe (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Aug 2019 06:13:34 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x7QA8CZb116476
        for <linux-next@vger.kernel.org>; Mon, 26 Aug 2019 06:13:34 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2umbpb47k7-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Mon, 26 Aug 2019 06:13:33 -0400
Received: from localhost
        by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <sachinp@linux.vnet.ibm.com>;
        Mon, 26 Aug 2019 11:13:32 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Mon, 26 Aug 2019 11:13:30 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x7QADTqD23986202
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 26 Aug 2019 10:13:29 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4841B52051;
        Mon, 26 Aug 2019 10:13:29 +0000 (GMT)
Received: from [9.199.196.197] (unknown [9.199.196.197])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id A5F425204F;
        Mon, 26 Aug 2019 10:13:28 +0000 (GMT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [powerpc]WARN : arch/powerpc/platforms/powernv/smp.c:160
From:   Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <20190826090905.GA1792@in.ibm.com>
Date:   Mon, 26 Aug 2019 15:43:27 +0530
Cc:     linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org
Content-Transfer-Encoding: 8BIT
References: <AB1A20B4-523B-491E-AB89-124AD2810C17@linux.vnet.ibm.com>
 <20190826090905.GA1792@in.ibm.com>
To:     ego@linux.vnet.ibm.com
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 19082610-0020-0000-0000-0000036411AA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082610-0021-0000-0000-000021B958C0
Message-Id: <D852BB99-DFA8-4A0A-ADE6-0CCB7302D2FA@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-26_06:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=801 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908260112
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> On 26-Aug-2019, at 2:39 PM, Gautham R Shenoy <ego@linux.vnet.ibm.com> wrote:
> 
>> c000000000055198] start_secondary+0x638/0x680
>> [   40.285680] [c0000007f5527f90] [c00000000000ac5c] start_secondary_prolog+0x10/0x14
>> [   40.285680] Instruction dump:
>> [   40.285681] fb61ffd8 fb81ffe0 fba1ffe8 fbc1fff0 fbe1fff8 f8010010 f821fe21 e90d1178 
>> [   40.285684] f9010198 39000000 892d0988 792907e0 <0b090000> 39200002 7d210164 39200003 
>> [   40.285687] ---[ end trace 72c90a064122d9e4 ]—
> 
> Could you please share the test-case that you were running and the
> command line parameter ?

No test was run. Only a boot test.

Thanks
-Sachin
